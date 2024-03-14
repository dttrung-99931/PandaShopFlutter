import 'package:json_annotation/json_annotation.dart';
part 'lab_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LabModel {
  final String? name;
  final String? address;
  final String? code;
  int? id;
  @JsonKey(name: 'sort_order')
  int? sortOrder;
  @JsonKey(name: 'lab_parent_flg')
  bool? labParentFlg;
  @JsonKey(name: 'parent_lab_id')
  int? parentLabId;
  @JsonKey(name: 'clinic_select_flg')
  bool? clinicSelectFlg;
  // Null? labCorpKbn;
  @JsonKey(name: 'lab_name')
  String? labName;
  @JsonKey(name: 'lab_name_f')
  String? labNameF;
  // Null? labZip;
  // Null? labPref;
  // Null? prefId;
  // Null? cityId;
  // Null? labAddress;
  // Null? labBuilding;
  @JsonKey(name: 'lab_phone')
  String? labPhone;
  // Null? labFax;
  // Null? labEmail;
  @JsonKey(name: 'evinote_status')
  bool? evinoteStatus;
  // Null? evinotePrinterNumber;
  @JsonKey(name: 'evm_status')
  bool? evmStatus;
  // Null? prefId;
  // Null? cityId;
  // Null? pref;
  // Null? city;

  LabModel({
    required this.name,
    required this.address,
    required this.code,
    this.id,
    this.sortOrder,
    this.labParentFlg,
    this.parentLabId,
    this.clinicSelectFlg,
    // this.labCorpKbn,
    this.labName,
    this.labNameF,
    // this.labZip,
    // this.labPref,
    // this.prefId,
    // this.cityId,
    // this.labAddress,
    // this.labBuilding,
    this.labPhone,
    // this.labFax,
    // this.labEmail,
    this.evinoteStatus,
    // this.evinotePrinterNumber,
    this.evmStatus,
    // this.prefId,
    // this.cityId,
    // this.pref,
    // this.city
  });

  static List<LabModel> get dummyLabs => [
        LabModel(address: 'AAAデンタルラボラトリー', code: '0451234567', name: '240-0003 神奈川県横浜市保土ケ谷区天王町1-1-1 XXXビルディング3F'),
        // LabDto(
        //     address: 'AAAデンタルラボラトリー',
        //     code: '0451234567',
        //     name: '240-0003 神奈川県横浜市保土ケ谷区天王町1-1-1 XXXビルディング3F'),
      ];

  factory LabModel.fromJson(Map<String, dynamic> json) => _$LabModelFromJson(json);
  Map<String, dynamic> toJson() => _$LabModelToJson(this);
}
