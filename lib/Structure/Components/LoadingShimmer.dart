import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

///Displays a stylized loading shimmer with soft corners
class LoadingShimmer extends StatelessWidget {
  final double height;

  const LoadingShimmer({super.key, this.height=100});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),

        child: SizedBox(width: double.infinity, height: height,),
      ),
    );
  }

}