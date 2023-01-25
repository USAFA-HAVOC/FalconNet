enum Role {
  unrecognized,
  recognized,
  signable,
  jdo,
  sdo,
  cwoc,
  squadron_admin,
  group_admin,
  wing_admin
}

extension RoleTypeNames on Role {
  String get description {
    switch (this) {
      case Role.unrecognized: return "Unrecognized";
      case Role.recognized: return "Recognized";
      case Role.signable: return "Signable";
      case Role.jdo: return "JDO";
      case Role.sdo: return "SDO";
      case Role.cwoc: return "CWOC";
      case Role.squadron_admin: return "Squadron Admin";
      case Role.group_admin: return "Group Admin";
      case Role.wing_admin: return "Wing Admin";
    }
  }

  bool get isAdmin {
    switch (this) {
      case Role.squadron_admin: return true;
      case Role.group_admin: return true;
      case Role.wing_admin: return true;
      default: return false;
    }
  }

  List<Role> get delegable {
    if (isAdmin) {
      var delegables = Role.values.where((r) => !r.isAdmin).toList();
      if (this == Role.group_admin) {
        delegables.add(Role.squadron_admin);
      }
      else if (this == Role.wing_admin) {
        delegables.add(Role.group_admin);
      }
      return delegables;
    }
    return [];
  }

  bool isGreaterThan(Role other) {
    if (!isAdmin) {
      return false;
    }
    if (other.isAdmin) {
      return <Role>[other, this].highest! != other;
    }
    return true;
  }
}

extension RoleList on List<Role> {
  Role? get highest {
    if (any((r) => r == Role.wing_admin)) {
      return Role.wing_admin;
    }
    if (any((r) => r == Role.group_admin)) {
      return Role.group_admin;
    }
    if (any((r) => r == Role.squadron_admin)) {
      return Role.squadron_admin;
    }
    return null;
  }
}