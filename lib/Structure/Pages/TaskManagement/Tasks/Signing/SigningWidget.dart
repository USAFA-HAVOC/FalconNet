import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import  'package:string_similarity/string_similarity.dart';

import '../../../../../Model/Database/UnitData.dart';
import '../../../../../Model/Database/UserStatus.dart';
import '../../../../../Model/Database/UserSummary.dart';
import '../../../../Components/FNSearchBar.dart';
import 'SignBox.dart';

///List displaying all squadron names and allowing SDO to sign di
class SigningWidget extends StatefulWidget {
  final UnitData? status;
  final String? event;
  final void Function(UserSummary) onSign;
  final void Function(UserSummary)? onExcuse;

  const SigningWidget({
    super.key,
    required this.status,
    required this.onSign,
    this.onExcuse,
    this.event
  });

  @override
  State<SigningWidget> createState() => SigningWidgetState();
}

class SigningWidgetState extends State<SigningWidget> {
  String query = "";
  
  List<UserSummary> search(List<UserSummary> applicable, String q) {
    var mutable = applicable;
    mutable.sort((a, b) {
      var first = a.name.toLowerCase();
      var second = b.name.toLowerCase();
      var query = q.toLowerCase();
      var firstScore = first.similarityTo(query);
      var secondScore = second.similarityTo(query);
      if (firstScore > secondScore) {
        return -1;
      }
      else if (secondScore > firstScore) {
        return 1;
      }
      else {
        return first.compareTo(second);
      }
    });

    return mutable;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.status == null) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: const SizedBox(width: double.infinity, height: 100,),
        ),
      );
    }

    var ordered = search(
        widget.status!.members.toList()
            .where((u) => u.status.status != UserStatus.unassigned.name)
            .toList(),
        query
    );

    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: ordered.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return FNSearchBar(onChanged: (change) => setState(() => query = change));
        }
        var member = ordered[index - 1];

        return SignBox(
          user: member,
          event: widget.event,
          onSign: () => widget.onSign(member),
          onExcuse: (widget.onExcuse != null) ? () => widget.onExcuse?.call(member) : null,
        );
      },
    );
  }
}