class FoodModel {
  String id;
  String idShop;
  String idGrp;
  String nameFood;
  String pathImage;
  String price;
  String detail;
  String status;

  FoodModel(
      {this.id,
      this.idShop,
      this.idGrp,
      this.nameFood,
      this.pathImage,
      this.price,
      this.status,
      this.detail});

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idShop = json['idShop'];
    idGrp = json['idGrp'];
    nameFood = json['NameFood'];
    pathImage = json['PathImage'];
    price = json['Price'];
    detail = json['Detail'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idShop'] = this.idShop;
    data['idGrp'] = this.idGrp;
    data['NameFood'] = this.nameFood;
    data['PathImage'] = this.pathImage;
    data['Price'] = this.price;
    data['Detail'] = this.detail;
    data['Status'] = this.status;
    return data;
  }
}
