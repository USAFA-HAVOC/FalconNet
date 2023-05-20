enum UserStatus {
  unsigned,
  signed,
  out,
  leave,
  excused
}

extension UserStatusNames on UserStatus {
  String display() {
    switch (this) {
      case UserStatus.signed: return "Signed DI";
      case UserStatus.unsigned: return "Unsigned";
      case UserStatus.out: return "Signed-Out";
      case UserStatus.leave: return "On Leave";
      case UserStatus.excused: return "Excused";
    }
  }

  static UserStatus parse(String data) {
    return UserStatus.values.firstWhere((value) => value.name == data);
  }
}