abstract class PaginatedRequest {
  final int page;
  final int limit;

  const PaginatedRequest({
    required this.page,
    required this.limit,
  });
}
