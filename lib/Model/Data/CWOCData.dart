class UnitData {
  final int signed;
  final int out;
  final int unsigned;
  final int? group;

  const UnitData({
    required this.signed,
    required this.out,
    required this.unsigned,
    this.group
  });
}

class CWOCData {
  final List<UnitData> units;

  const CWOCData({required this.units});
}