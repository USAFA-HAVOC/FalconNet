import 'package:falcon_net/Model/Database/TimedRole.dart';

enum Roles {
  fn_admin,
  wing_admin,
  group_admin,
  unit_admin,
  cadet,
  recognized,
  stan_eval,
  sdo,
  cwoc,
  signable,
  jdo,
  permanent_party
}

extension RoleNames on Roles {
  String description() {
    switch (this) {
      case Roles.wing_admin: return "Wing Admin";
      case Roles.fn_admin: return "FalconNet Admin";
      case Roles.group_admin: return "Group Admin";
      case Roles.unit_admin: return "Unit Admin";
      case Roles.recognized: return "Recognized";
      case Roles.sdo: return "SDO";
      case Roles.signable: return "Signable";
      case Roles.cwoc: return "CWOC";
      case Roles.jdo: return "JDO";
      case Roles.cadet: return "Cadet";
      case Roles.stan_eval: return "Stan/Eval";
      case Roles.permanent_party: return "Permanent Party";
    }
  }

  static Roles parseDescription(String input) {
    return Roles.values.firstWhere((r) => r.description() == input);
  }

  static Roles parseDirect(String input) {
    return Roles.values.firstWhere((r) => r.name == input);
  }

  TimedRole toIndefinite({String? unit}) => TimedRole((r) => r
      ..name = name
      ..unit = unit
  );
}