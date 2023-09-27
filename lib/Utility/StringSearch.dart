import 'package:falcon_net/Utility/ListExtensions.dart';
import 'package:string_similarity/string_similarity.dart';

List<T> searchList<T>(List<T> items, String Function(T) converter, String target) {
  List<MapEntry<T, String>> entries = items.map((e) => MapEntry(e, converter(e))).toList();
  List<T> ordered = [];
  for (var sub in Iterable.generate(target.length).map((c) => target.substring(0, c + 1))) {
    var suborder = entries
        .map((e) => MapEntry(e.key, e.value.allMatches(sub).firstOrNull?.start))
        .where((e) => e.value != null)
        .toList()
        .sortedKey((e) => e.value!)
        .map((e) => e.key)
        .toList();

    entries.removeWhere((e) => suborder.contains(e.key));

    ordered.addAll(ordered);
  }

  return ordered + entries.sortedKey((e) => e.value.similarityTo(target)).map((e) => e.key).toList();
}