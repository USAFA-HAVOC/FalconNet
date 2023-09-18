enum UserStatus {
  unassigned,
  unsigned,
  signed,
  out,
  leave,
  excused,
  overdue,
  out_returning
}

extension UserStatusNames on UserStatus {
  String display() {
    switch (this) {
      case UserStatus.signed: return "Signed";
      case UserStatus.unsigned: return "Unsigned";
      case UserStatus.out: return "Signed-Out";
      case UserStatus.out_returning: return "Signed-Out Returning";
      case UserStatus.leave: return "On Leave";
      case UserStatus.excused: return "Excused";
      case UserStatus.unassigned: return "Unassigned";
      case UserStatus.overdue: return "Overdue";
    }
  }

  static UserStatus parse(String data) {
    return UserStatus.values.firstWhere((value) => value.name == data);
  }
}