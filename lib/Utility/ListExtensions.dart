extension SortableList<E> on List<E> {
  List<E> sorted(int Function(E, E) comparator) {
    var mutable = this;
    mutable.sort(comparator);
    return mutable;
  }

  List<E> sortedKey(Comparable Function(E) converter) {
    var mutable = this;
    mutable.sort((a, b) => converter(a).compareTo(converter(b)));
    return mutable;
  }
}