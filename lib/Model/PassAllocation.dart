import 'package:falcon_net/Model/Pass.dart';

class PassAllocation {
  final int weekdayOvernight;
  final int weekendOvernight;
  final int weekdayDay;

  const PassAllocation({
    required this.weekdayDay,
    required this.weekdayOvernight,
    required this.weekendOvernight
  });
}