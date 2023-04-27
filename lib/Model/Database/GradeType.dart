enum GradeType {
  ami,
  pai,
  sami
}

extension GradeTypeNames on GradeType {
  static GradeType parse(String data) => GradeType.values.firstWhere((v) => v.name == data);

  String display() => name.toUpperCase();
}