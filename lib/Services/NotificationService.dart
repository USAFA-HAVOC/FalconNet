import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

import '../Utility/FNConstants.dart';
import '../Utility/TemporalFormatting.dart';

class NotificationService {
  static final NotificationService _notificationService = NotificationService._internal();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final AndroidNotificationDetails _androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      "falcon_net_2",
      "FalconNet 2.0",
      "Channel used for local FalconNet 2.0 notifications such as DI and Pass notifications",
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority
  );

  final IOSNotificationDetails _iOSPlatformChannelSpecifics = const IOSNotificationDetails(
      presentAlert: true,
      presentBadge: false,
      presentSound: true,
      subtitle: "FalconNet 2.0",
      threadIdentifier: "falcon_net_2"
  );

  late final NotificationDetails _platformChannelSpecifics = NotificationDetails(android: _androidPlatformChannelSpecifics, iOS: _iOSPlatformChannelSpecifics);

  List<void Function(String?)> listeners = [];

  factory NotificationService() => kIsWeb ? NotificationService._internal() : _notificationService;

  NotificationService._internal();

  Future<void> init() async {
    if (kIsWeb) return;

    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');

    const IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: null,
    );

    const InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
        macOS: null
    );

    initializeTimeZones();

    await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onSelectNotification: selectNotification
    );

    requestPermissions();
  }

  Future<bool> requestPermissions() async {
    if (kIsWeb) return false;

    return await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    ) ?? false;
  }

  void addListener(void Function(String?) listener) => listeners.add(listener);

  void removeListener(void Function(String?) listener) => listeners.remove(listener);

  Future selectNotification(String? payload) async {
    for (var listener in listeners) {
      listener(payload);
    }
  }

  void show({required String title, required String body, String? payload, String? id}) async {
    if (kIsWeb) return;

    await _flutterLocalNotificationsPlugin.show(
        id?.hashCode ?? Random().nextInt(10000),
        title,
        body,
        _platformChannelSpecifics,
        payload: payload
    );
  }

  void schedule({required String title, required String body, String? payload, required DateTime time, String? id}) async {
    if (kIsWeb) return;

    var utc = time.toUtc();
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        id?.hashCode ?? Random().nextInt(10000000),
        title,
        body,
        TZDateTime.utc(utc.year, utc.month, utc.day, utc.hour, utc.minute, utc.second),
        _platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime
    );
  }

  void scheduleDINotification() {
    _notificationService.cancel(id: "di");
    _notificationService.schedule(
        title: "Sign DI",
        body: "DI is now open - please sign!",
        time: DateTime.now().isBefore(combineDate(DateTime.now(), diOpens))
            ? combineDate(DateTime.now(), diOpens)
            : combineDate(DateTime.now(), diOpens).add(const Duration(days: 1)),
        id: "di",
        payload: "/"
    );
  }

  void cancelDINotification() => _notificationService.cancel(id: "di");

  void cancel({required String id}) async {
    if (kIsWeb) return;

    await _flutterLocalNotificationsPlugin.cancel(id.hashCode);
  }

  void cancelAll() async {
    if (kIsWeb) return;

    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<bool> exists({required String id}) async {
    if (kIsWeb) return false;
    return (await _flutterLocalNotificationsPlugin.pendingNotificationRequests())
        .where((r) => r.id == id.hashCode).isNotEmpty;
  }
}