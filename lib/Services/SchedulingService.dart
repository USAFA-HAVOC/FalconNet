import 'package:falcon_net/Model/Serializers.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/Database/SchedulingEvent.dart';

class SchedulingService {
  static final _schedulingService = SchedulingService._internal();
  final String _scheduleKey = "schedule";
  late List<SchedulingEvent> _events;
  final Map<String, List<void Function(String?)>> _listeners = {};

  factory SchedulingService() => _schedulingService;

  SchedulingService._internal();

  void init() async {
    var preferences = await SharedPreferences.getInstance();
    var schedule = preferences.getStringList(_scheduleKey);
    if (schedule != null) {
      _events = schedule.map((event) => serializers.fromJson(SchedulingEvent.serializer, event))
          .where((event) => event != null)
          .map((event) => event!)
          .where((event) => event.time.isAfter(DateTime.now()))
          .toList();
    }

    else {
      _events = [];
    }
    
    List<String> serialized = _events.map(
      (event) => serializers.toJson(SchedulingEvent.serializer, event)
    ).toList();
    await preferences.setStringList(_scheduleKey, serialized);
    
    for (var event in _events) {
      _primeEvent(event);
    }
  }

  void schedule({required String id, required DateTime time, String? payload}) async {
    SchedulingEvent event = SchedulingEvent((e) => e
        ..id = id
        ..time = time
        ..payload = payload
    );

    var preferences = await SharedPreferences.getInstance();
    _events.add(event);
    List<String> serialized = _events.map(
      (event) => serializers.toJson(SchedulingEvent.serializer, event)
    ).toList();
    await preferences.setStringList(_scheduleKey, serialized);
    _primeEvent(event);
  }

  void listen({required String id, required void Function(String?) callback}) {
    if (_listeners.containsKey(id)) {
      _listeners[id]!.add(callback);
    }
    else {
      _listeners[id] = [callback];
    }
  }

  void unlisten({required String id, required void Function(String?) callback}) {
    if (_listeners.containsKey(id)) {
      _listeners[id]!.remove(callback);
    }
  }

  void _primeEvent(SchedulingEvent event) {
    Future.delayed(event.time.difference(DateTime.now()), () {
      if (_listeners.containsKey(event.id)) {
        for (var listener in _listeners[event.id]!) {
          listener(event.payload);
        }
      }
    });
  }
}

class ScheduledBuilder extends StatefulWidget {
  final String id;
  final Widget Function(BuildContext, String?) builder;
  
  const ScheduledBuilder({super.key, required this.id, required this.builder});

  @override
  State<StatefulWidget> createState() => ScheduledBuilderState();
}

class ScheduledBuilderState extends State<ScheduledBuilder> {
  String? payload;
  int incrementer = 0;

  void response(p) {
    setState(() {
      payload = p;
      incrementer++;
    });
  }
  
  @override
  void initState() {
    SchedulingService().listen(
        id: widget.id,
        callback: response
    );
    super.initState();
  }

  @override
  void dispose() {
    SchedulingService().unlisten(
        id: widget.id,
        callback: response
    );
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) => widget.builder(context, payload);
}