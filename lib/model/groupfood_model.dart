class GroupFoodModel {
  String id;
  String idShop;
  String nameGroup;
  String pathImage;

  GroupFoodModel({
    this.id,
    this.idShop,
    this.nameGroup,
    this.pathImage,
  });

  GroupFoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idShop = json['idShop'];
    nameGroup = json['NameGroup'];
    pathImage = json['PathImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idShop'] = this.idShop;
    data['NameGroup'] = this.nameGroup;
    data['PathImage'] = this.pathImage;
    return data;
  }
}
