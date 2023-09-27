import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class FNPage extends StatelessWidget {
  final String title;
  final List<Widget>? children;
  final EdgeInsets padding;
  final bool wrap;
  final double? minWrapWidth;
  final List<Widget>? wrapped;
  final List<Widget>? stacked;
  final int? count;

  const FNPage({
    super.key,
    required this.title,
    required this.children,
    this.padding = const EdgeInsets.all(20),
  }) :
        wrap = false,
        wrapped = null,
        stacked = null,
        minWrapWidth = null,
        count = null;

  const FNPage.wrap({
    super.key,
    required this.title,
    this.wrapped,
    this.stacked,
    this.minWrapWidth,
    this.count = 2,
    this.padding = const EdgeInsets.all(20),
  }) :
        wrap = true,
        children = null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: kIsWeb ? CrossAxisAlignment.center : CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: kIsWeb ? 12: 0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge!,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 10),
            if (wrap && MediaQuery.of(context).size.width >= (minWrapWidth ?? 0)) Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (wrapped != null) Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: wrapped!.map((c) => Container(
                    constraints: BoxConstraints.loose(Size.fromWidth((MediaQuery.of(context).size.width * 0.9) / count!)),
                    child: c,
                  )).toList(),
                ),

                if (stacked != null) Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: stacked!,
                )
              ],
            )
            else if (wrap) ...[
              ...wrapped ?? [],
              ...stacked ?? []
            ].map((c) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: c,
            ))
            else if (MediaQuery.of(context).size.width > (children!.length < 4 ? 600 : 1000))
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: min(MediaQuery.of(context).size.height * 3 / 5, 500)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ...children!.map(
                          (c) => Container(
                        constraints: BoxConstraints(
                          maxWidth: title == 'Task Management' ? 300 : 500,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: c,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else
              ...children!.map(
                    (c) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: c,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
/*
class FNPage extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final EdgeInsets padding;

  const FNPage({
    super.key,
    required this.title,
    required this.children,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: kIsWeb ? 12: 0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge!,
              ),
            ),
            const SizedBox(height: 10),
            if (kIsWeb &&
                MediaQuery.of(context).size.width >
                    (children.length < 4 ? 600 : 1000))
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  ...children.map(
                    (c) => Container(
                      constraints: BoxConstraints(
                        maxWidth: title == 'Task Management' ? 300 : 500,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: c,
                      ),
                    ),
                  ),
                ],
              )
            else
              ...children.map(
                (c) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: c,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
*/