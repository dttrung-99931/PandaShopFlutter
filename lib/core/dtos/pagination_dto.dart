import 'package:evievm_app/core/model/base_response.dart';

class PaginationDto {
  PaginationDto({
    required this.pageSize,
    required this.pageNum,
    required this.total,
  });
  final int pageSize;
  final int pageNum;
  final int total;

  factory PaginationDto.fromModel(PaginationModel model) {
    return PaginationDto(
      pageSize: model.pageSize,
      pageNum: model.pageNum,
      total: model.total,
    );
  }
}
