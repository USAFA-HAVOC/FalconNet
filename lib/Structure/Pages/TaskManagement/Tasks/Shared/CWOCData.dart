import 'package:falcon_net/Model/Data/DIStatus.dart';

import 'Signee.dart';

///Summary of unit di information
class UnitInfo {
  final String name;
  final int signed;
  final int unsigned;
  final int out;
  final int? group;

  const UnitInfo({
    required this.signed,
    required this.out,
    required this.unsigned,
    required this.name,
    this.group
  });
}

///Full unit di data including individual member status
class UnitData extends UnitInfo {
  final List<Signee> members;

  UnitData({
    required super.signed,
    required super.out,
    required super.unsigned,
    required super.name,
    required this.members,
    super.group
  }) {
    //Sorts members first by di status then alphabetically
    members.sort((first, second) {
      var firstName = first.name;
      var secondName = second.name;
      if (first.status == second.status) {
        return firstName.toLowerCase().compareTo(secondName.toLowerCase());
      }
      else {
        if (first.status == DIStatus.unsigned) {
          return -1;
        }
        else if (first.status == DIStatus.signedDI) {
          return 1;
        }
        else if (second.status == DIStatus.unsigned) {
          return 1;
        }
        else {
          return -1;
        }
      }
    });
  }

  ///Returns a new unit data object with a given member signed for
  UnitData sign(Signee signee) {
    var mutable = members.where((member) => member.id != signee.id).toList();
    var index = members.indexOf(signee);
    mutable.insert(index, signee.signed());
    return UnitData(signed: signed + 1, out: out, unsigned: unsigned - 1, name: name, members: mutable, group: group);
  }
}

///Represents information needed for cwoc page
class CWOCData {
  final List<UnitInfo> units;

  const CWOCData({required this.units});

  ///Returns a new cwoc data object with a given unit updated
  CWOCData set(String unit, UnitInfo value) {
    var mutable = units.where((element) => element.name != unit).toList();
    var index = units.indexOf(units.firstWhere((child) => child.name == unit));
    mutable.insert(index, value);
    return CWOCData(units: mutable);
  }
}