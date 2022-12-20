import 'package:flutter/cupertino.dart';

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
      )
    );
  }
}