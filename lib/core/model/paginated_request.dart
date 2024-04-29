import 'package:evievm_app/core/utils/constants.dart';

abstract class PaginatedRequest {
  final int pageSize;
  final int pageNum;

  const PaginatedRequest({
    required int? pageSize,
    required int? pageNum,
    // this.pageSize = Constants.defaultPageSize,
    // this.pageNum = Constants.startPageNum,
  })  : pageSize = pageSize ?? Constants.defaultPageSize,
        pageNum = pageNum ?? Constants.startPageNum;
}
