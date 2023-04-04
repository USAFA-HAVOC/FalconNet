enum Roles {
  fn_admin,
  wing_admin,
  unit_admin,
  cadet,
  recognized,
  stan_eval,
  sdo,
  cwoc,
  signable,
  jdo,
  pp
}

extension RoleNames on Roles {
  String description() {
    switch (this) {
      case Roles.wing_admin: return "Wing Admin";
      case Roles.fn_admin: return "FalconNet Admin";
      case Roles.unit_admin: return "Unit Admin";
      case Roles.recognized: return "Recognized";
      case Roles.sdo: return "SDO";
      case Roles.signable: return "Signable";
      case Roles.cwoc: return "CWOC";
      case Roles.jdo: return "JDO";
      case Roles.cadet: return "Cadet";
      case Roles.stan_eval: return "Stan/Eval";
      case Roles.pp: return "Permanent Party";
    }
  }

  static Roles parseDescription(String input) {
    return Roles.values.firstWhere((r) => r.description() == input);
  }

  static Roles parseDirect(String input) {
    return Roles.values.firstWhere((r) => r.name == input);
  }
}