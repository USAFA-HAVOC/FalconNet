import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge!,
              ),
            ),
            const SizedBox(height: 10),
            if (kIsWeb &&
                MediaQuery.of(context).size.width >
                    (children.length <= 3 ? 600 : 1000))
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ...children.map(
                      (c) => Expanded(
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
