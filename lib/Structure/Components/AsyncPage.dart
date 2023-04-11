import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:flutter/material.dart';

import 'FNPage.dart';

class AsyncPage<T> extends StatelessWidget {
  final String title;
  final Future<T> connection;
  final List<Widget> Function(BuildContext, T) builder;
  final List<Widget> placeholder;

  const AsyncPage({
    super.key,
    required this.title,
    required this.connection,
    required this.builder,
    this.placeholder = const [LoadingShimmer(height: 200,)],
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: connection,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FNPage(
                title: title,
                children: builder(context, snapshot.data as T)
            );
          }
          else {
            return FNPage(
              title: title,
              children: placeholder,
            );
          }
        }
    );
  }
}