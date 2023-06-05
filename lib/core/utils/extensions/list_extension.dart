import 'dart:math' as math;

extension ListExtension<T> on List<T> {
  List<T> addBetweenEvery(T value) {
    List<T> r = [];
    asMap().forEach((i, e) => i < length - 1 ? r.addAll([e, value]) : r.add(e));
    return r;
  }

  // interleave merge list function
  List<T> interleave(List<T> other) {
    final result = <T>[];
    final length = math.max(this.length, other.length);
    for (var i = 0; i < length; i++) {
      if (i < this.length) {
        result.add(this[i]);
      }
      if (i < other.length) {
        result.add(other[i]);
      }
    }
    return result;
  }

  T? firstWhereOrNull(bool Function(T) test) {
    try {
      return firstWhere(test);
    } catch (e) {
      return null;
    }
  }

  List<T> assignAll(List<T> other) {
    clear();
    addAll(other);
    return this;
  }

  T? get firstOrNull {
    try {
      return first;
    } catch (e) {
      return null;
    }
  }

  T? atOrNull(int index) {
    try {
      return this[index];
    } catch (e) {
      return null;
    }
  }

  void replaceWhere(bool Function(T item) match, T replace) {
    int index = indexWhere(match);
    if (index != -1) {
      this[index] = replace;
    }
  }

  void sort2(Comparable Function(T) getSortValue, bool isAsc) {
    sort((e1, e2) => (isAsc ? 1 : -1) * getSortValue(e1).compareTo(getSortValue(e2)));
  }
}

extension NullableListExtension<T> on List<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
