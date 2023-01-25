import 'package:falcon_net/Model/Database/Role.dart';

class TimedRole {
  final Role role;
  final DateTime start;
  final DateTime end;

  const TimedRole({required this.role, required this.start, required this.end});
}

class Delegate {
  final String name;
  final String id;
  final List<TimedRole> roles;

  const Delegate({required this.name, required this.id, required this.roles});
}

extension TimedRoleOperations on List<TimedRole> {

  DateTime earliest({required Role role, DateTime? first, DateTime? last}) {
    var kind = where((r) => r.role.isGreaterThan(role)).map((r) => r.start).toList();
    assert(kind.isNotEmpty);
    kind.sort();
    if (first != null) {
      if (kind.first.compareTo(first) == -1) {
        return first;
      }
    }
    if (last != null) {
      if (kind.first.compareTo(last) == 1) {
        return last;
      }
    }

    return kind.first;
  }

  DateTime latest({required Role role, DateTime? first, DateTime? last}) {
    var kind = where((r) => r.role.isGreaterThan(role)).map((r) => r.end).toList();
    assert(kind.isNotEmpty);
    kind.sort();
    if (first != null) {
      if (kind.last.compareTo(first) == -1) {
        return first;
      }
    }
    if (last != null) {
      if (kind.last.compareTo(last) == 1) {
        return last;
      }
    }

    return kind.last;
  }

  DateTime constrain(DateTime date, {required Role role, required bool start}) {
    var kind = where((r) => r.role.isGreaterThan(role)).map((r) => r.start).toList();
    kind += where((r) => r.role.isGreaterThan(role)).map((r) => r.end).toList();
    assert(kind.isNotEmpty);
    kind.sort();
    if (start) {
      return kind.first.compareTo(date) == -1 ? date : kind.first;
    }
    else {
      return kind.last.compareTo(date) == 1 ? date : kind.last;
    }
  }
}

class DelegationData {
  final List<Delegate> delegates;
  final List<TimedRole> owner;

  const DelegationData({required this.delegates, required this.owner});

  DelegationData assign(Delegate delegate, List<TimedRole> roles) {
    var mutable = delegates.where((d) => d.id != delegate.id).toList();
    var index = delegates.indexOf(delegate);
    mutable.insert(index, Delegate(name: delegate.name, id: delegate.id, roles: roles));
    return DelegationData(delegates: mutable, owner: owner);
  }
}