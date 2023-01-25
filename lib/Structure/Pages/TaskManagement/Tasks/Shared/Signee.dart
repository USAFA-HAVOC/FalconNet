enum DIStatus {
  signedOut,
  signedDI,
  unsigned,
}

///Represents minimum cadet information for sdo and cwoc controllers
class Signee {
  final String name;
  final String id;
  final DIStatus status;

  const Signee({required this.name, required this.id, required this.status});

  Signee signed() {
    return Signee(name: name, id: id, status: DIStatus.signedDI);
  }
}