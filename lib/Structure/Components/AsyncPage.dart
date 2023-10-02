import 'package:dio/dio.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:flutter/material.dart';

import 'FNPage.dart';

class AsyncPage<T> extends StatelessWidget {
  final String title;
  final Future<T> connection;
  final List<Widget> Function(BuildContext, T)? builder;
  final double? minWrapWidth;
  final List<Widget>? placeholder;
  final List<Widget>? wrappedPlaceholder;
  final List<Widget>? stackedPlaceholder;
  final List<Widget> Function(BuildContext, T)? wrappedBuilder;
  final List<Widget> Function(BuildContext, T)? stackedBuilder;
  final bool wrap;
  final int? count;
  final EdgeInsets padding;

  const AsyncPage({
    super.key,
    required this.title,
    required this.connection,
    required this.builder,
    this.placeholder = const [LoadingShimmer(height: 200,)],
    this.padding = const EdgeInsets.all(20)
  }) :
        wrap = false,
        wrappedBuilder = null,
        wrappedPlaceholder = null,
        stackedBuilder = null,
        stackedPlaceholder = null,
        minWrapWidth = null,
        count = null;

  const AsyncPage.wrap({
    super.key,
    required this.title,
    required this.connection,
    this.minWrapWidth,
    this.wrappedBuilder,
    this.stackedBuilder,
    this.count = 2,
    this.wrappedPlaceholder = const [LoadingShimmer(height: 200,)],
    this.stackedPlaceholder = const [],
    this.padding = const EdgeInsets.all(20)
  }) :
        wrap = true,
        placeholder = null,
        builder = null;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: connection,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            if (wrap) {
              return FNPage.wrap(
                  title: title,
                  minWrapWidth: minWrapWidth,
                  count: count,
                  wrapped: wrappedBuilder?.call(context, snapshot.data as T),
                  stacked: stackedBuilder?.call(context, snapshot.data as T),
              );
            }
            else {
              return FNPage(
                  title: title,
                  padding: padding,
                  children: builder!(context, snapshot.data as T)
              );
            }
          }
          
          else if (snapshot.hasError) {
            if (snapshot.error! is DioError) {
              if ((snapshot.error! as DioError).type == DioErrorType.response) {
                return FNPage(
                    title: title,
                    padding: padding,
                    children: [
                      Icon(
                        Icons.lock,
                        size: MediaQuery.of(context).size.width * 0.5,
                      ),

                      Text(
                        "Request Refused",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    ]
                );
              }
            }

            return FNPage(
                title: title,
                padding: padding,
                children: [
                  const Icon(
                    Icons.wifi_off,
                    size: 100,
                  ),

                  Text(
                    "No Connection",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ]
            );
          }
          
          else {
            if (wrap) {
              return FNPage.wrap(
                title: title,
                padding: padding,
                count: 1,
                minWrapWidth: minWrapWidth,
                wrapped: wrappedPlaceholder,
                stacked: stackedPlaceholder,
              );
            }
            else {
              return FNPage(
                title: title,
                padding: padding,
                children: placeholder,
              );
            }
          }
        }
    );
  }
}