import 'package:flutter/cupertino.dart';

///Icon that performs action on tap
class TapIcon extends StatelessWidget {
  final IconData icondata;
  final void Function() onTap;
  final Color? color;

  const TapIcon(this.icondata, {required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icondata,
        color: color,
        size: 25,
      )
    );
  }
}