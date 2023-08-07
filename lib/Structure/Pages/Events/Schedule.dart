import 'package:falcon_net/Model/Database/AccountabilityEvent.dart';
import 'package:falcon_net/Structure/Pages/Events/DailySummary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../../Model/Database/UserEvent.dart';
import '../../Components/PageWidget.dart';

class Schedule extends StatelessWidget {
  final List<UserEvent> events;

  const Schedule({super.key, required this.events});

  @override
  Widget build(BuildContext context) => PageWidget(
      title: "Upcoming Events",
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Theme.of(context).dividerColor)
          ),
          child: ImageSlideshow(
              height: MediaQuery.of(context).size.height * 0.4,
              children: [0, 1, 2, 3, 4, 5, 6].map((d) =>
                  DailySummary(
                      events: events,
                      day: d
                  )
              ).toList()
          ),
        )
      ]
  );
}