class SafetyIndexModel {
  late String area;
  late String safetyIndex;
  late String category;



  SafetyIndexModel(this.area, this.safetyIndex, this.category);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{

      'area': area,
      'safetyIndex': safetyIndex,
      'category': category
    };
    return map;
  }

  SafetyIndexModel.fromMap(Map<String, dynamic> map) {
    area = map['area'];
    safetyIndex = map['safetyIndex'];
    category = map['category'];
  }

}