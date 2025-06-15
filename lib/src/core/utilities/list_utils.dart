extension ListUtils<T> on List<T?> {
  Iterable<T> whereNotNull() => where((e) => e != null).map((e) => e!);
}
