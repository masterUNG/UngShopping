class ProductModel {
  // Field
  String color, detail, name, pathImage, price;

  // Constructor
  ProductModel(this.color, this.detail, this.name, this.pathImage, this.price);

  ProductModel.fromFireStore(Map<String, dynamic> parseFireStore) {
    color = parseFireStore['Color'];
    detail = parseFireStore['Detail'];
    name = parseFireStore['Name'];
    pathImage = parseFireStore['PathImage'];
    price = parseFireStore['Price'];
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'color = $color, detail = $detail, name = $name, path = $pathImage, price = $price';
  }
}
