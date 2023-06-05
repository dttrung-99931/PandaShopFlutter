class LabBranchModel {
  final String id;
  final String name;
  final String address;

  LabBranchModel(this.id, this.name, this.address);

  static List<LabBranchModel> get dummyList => [
        LabBranchModel(DateTime.now().toString(), '横浜本社', '神奈川県横浜市西区北幸1-1-1'),
        LabBranchModel(DateTime.now().toString(), '千歳ラボ', '北海道千歳市柏台南1234567890'),
        LabBranchModel(DateTime.now().toString(), '北郷ラボ', '北海道札幌市白石区白石12345678912'),
        LabBranchModel(DateTime.now().toString(), '厚別ラボ', '北海道札幌市12345678'),
        LabBranchModel(DateTime.now().toString(), '豊平オフィス', '北海道札幌市豊平区123456789'),
        LabBranchModel(DateTime.now().toString(), '平沼オフィス', '神奈川県横浜市西区123456789012'),
        LabBranchModel(DateTime.now().toString(), '苫小牧', '北海道苫小牧市123456789012'),
      ];
}
