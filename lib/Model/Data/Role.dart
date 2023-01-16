///Possible cadet roles
enum RoleType {
  unrecognized,
  recognized,
  signable,
  jdo,
  sdo,
  cwoc,
}

extension RoleTypeNames on RoleType {
  String get description {
    switch (this) {
      case RoleType.unrecognized: return "Unrecognized";
      case RoleType.recognized: return "Recognized";
      case RoleType.signable: return "Signable";
      case RoleType.jdo: return "JDO";
      case RoleType.sdo: return "SDO";
      case RoleType.cwoc: return "CWOC";
    }
  }
}

enum RoleLevel {
  baseline,
  delegation,
  staff,
  squadron,
  group,
  wing,
}

extension RoleLevelInfo on RoleLevel {
  String get description {
    switch (this) {
      case RoleLevel.baseline: return "Baseline";
      case RoleLevel.delegation: return "Delegation";
      case RoleLevel.staff: return "Staff";
      case RoleLevel.squadron: return "Squadron Admin";
      case RoleLevel.group: return "Group Admin";
      case RoleLevel.wing: return "Wing Admin";
    }
  }

  int get rawValue {
    switch (this) {
      case RoleLevel.baseline: return 0;
      case RoleLevel.delegation: return 1;
      case RoleLevel.staff: return 2;
      case RoleLevel.squadron: return 3;
      case RoleLevel.group: return 4;
      case RoleLevel.wing: return 5;
    }
  }

  static RoleLevel fromValue(int value) {
    switch (value) {
      case 0: return RoleLevel.baseline;
      case 1: return RoleLevel.delegation;
      case 2: return RoleLevel.staff;
      case 3: return RoleLevel.squadron;
      case 4: return RoleLevel.group;
      case 5: return RoleLevel.wing;
    }
    throw Exception("Value out of bounds");
  }

  List<RoleLevel> get delegable {
    return Iterable<RoleLevel>.generate(rawValue, (index) => fromValue(index)).toList();
  }
}

class Role {
  final RoleLevel level;
  final RoleType type;

  const Role({required this.type, this.level = RoleLevel.baseline});
}