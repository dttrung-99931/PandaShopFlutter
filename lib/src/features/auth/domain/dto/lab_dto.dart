import 'package:evievm_app/src/features/auth/data/models/response/lab_model.dart';
import 'package:evievm_app/src/shared/models/selectable.dart';

// ignore: must_be_immutable
class LabDTO extends Selectable {
  final int? id;
  final String? name;

  LabDTO({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name, isSelected];
  factory LabDTO.fromModel(LabModel model) {
    final labDTO = LabDTO(
      id: model.id,
      name: model.labNameF,
    );

    return labDTO;
  }

  static List<LabDTO> get dummyLabDTOs => [
        LabDTO(id: DateTime.now().microsecond, name: '千歳ラボ'),
        LabDTO(id: DateTime.now().microsecond, name: '北郷ラボ'),
        LabDTO(id: DateTime.now().microsecond, name: '厚別ラボ'),
        LabDTO(id: DateTime.now().microsecond, name: '豊平オフィス'),
        LabDTO(id: DateTime.now().microsecond, name: '平沼オフィス'),
        LabDTO(id: DateTime.now().microsecond, name: '横浜本社'),
        LabDTO(id: DateTime.now().microsecond, name: '苫小牧'),
      ];
}
