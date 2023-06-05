import 'package:json_annotation/json_annotation.dart';

part 'paginated_list.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginatedList<T> {
  final List<T> data;
  @JsonKey(name: 'last_page')
  final int? lastPage;
  @JsonKey(name: 'current_page')
  final int? currentPage;
  final int? to;
  final int? from;
  @JsonKey(name: 'per_page')
  final int? perPage;
  final int? total;

  PaginatedList({
    this.data = const [],
    this.lastPage,
    this.currentPage = 0,
    this.to,
    this.from,
    this.perPage,
    this.total,
  });
  PaginatedList<T> copyWith({
    List<T>? data,
    final int? lastPage,
    final int? currentPage,
    final int? to,
    final int? from,
    final int? perPage,
    final int? total,
  }) {
    return PaginatedList(
      data: data ?? this.data,
      lastPage: lastPage ?? this.lastPage,
      currentPage: currentPage ?? this.currentPage,
      to: to ?? this.to,
      from: from ?? this.from,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
    );
  }

  factory PaginatedList.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginatedListFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$PaginatedListToJson(this, toJsonT);

  PaginatedList<U> mapList<U>(U Function(T value) map) {
    return PaginatedList<U>(
      data: data.map(map).toList(),
      lastPage: lastPage,
      currentPage: currentPage,
      to: to,
      from: from,
      perPage: perPage,
      total: total,
    );
  }

  bool get isEmpty => data.isEmpty;

  bool get isNotEmpty => data.isNotEmpty;
  bool get isLastPage => (currentPage ?? 0) >= (lastPage ?? 0);
}
