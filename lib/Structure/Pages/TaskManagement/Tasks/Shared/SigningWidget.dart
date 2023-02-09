import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import  'package:string_similarity/string_similarity.dart';

import '../../../../../Model/Database/UnitData.dart';
import '../../../../../Model/Database/User.dart';
import 'SignBox.dart';

///List displaying all squadron names and allowing SDO to sign di
class SigningWidget extends StatefulWidget {
  final UnitData? di;
  final void Function(User) onSign;

  const SigningWidget({super.key, required this.di, required this.onSign});

  @override
  State<SigningWidget> createState() => SigningWidgetState();
}

class SigningWidgetState extends State<SigningWidget> {
  String query = "";
  
  List<User> search(List<User> applicable, String q) {
    var mutable = applicable;
    mutable.sort((a, b) {
      var first = a.personal_info.full_name.toLowerCase();
      var second = b.personal_info.full_name.toLowerCase();
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
    if (widget.di == null) {
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

    var ordered = search(widget.di!.members.toList(), query);

    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: ordered.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).dividerColor), borderRadius: BorderRadius.circular(10)),
                labelStyle: Theme.of(context).textTheme.bodyLarge,
                labelText: "Search",
                suffixIcon: Icon(Icons.search)
            ),
            onChanged: (q) => setState(() => query = q),
          );
        }

        var member = ordered[index - 1];

        return SignBox(
          name: member.personal_info.full_name,
          status: member.status(),
          onSign: () => widget.onSign(member),
        );
      },
    );
  }
}