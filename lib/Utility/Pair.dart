class Pair<A, B> {
  Pair(this.left, this.right);

  final A left;
  final B right;

  @override
  String toString() => 'Pair[$left, $right]';
}
