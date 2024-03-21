// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/common/data/models/response/address_field_model.dart';

class AddressFieldDto {
  AddressFieldDto({
    required this.name,
    required this.code,
    required this.path,
  });
  final String name;
  final String code;
  final String path;

  static AddressFieldDto empty = AddressFieldDto(name: '', code: '', path: '');
  static AddressFieldDto emptyProvOrCity = AddressFieldDto(name: '- Chọn tỉnh/thành phố -', code: '', path: '');
  static AddressFieldDto emptyDistrict = AddressFieldDto(name: '- Chọn quận/huyện -', code: '', path: '');
  static AddressFieldDto emptyComnuneOrWard = AddressFieldDto(name: '- Chọn xã/phường -', code: '', path: '');

  factory AddressFieldDto.fromModel(AddressFieldModel model) {
    return AddressFieldDto(name: model.name, code: model.code, path: model.path);
  }
}
