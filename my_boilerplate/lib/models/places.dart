class Places {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;
  String? name;
  String? kilometers;
  String? date;
  double? rate;
  int? price;

  Places(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.imageUrl,
      this.name,
      this.kilometers,
      this.date,
      this.rate,
      this.price});

  Places.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
    name = json['name'];
    kilometers = json['kilometers'];
    date = json['date'];
    rate = json['rate'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image_url'] = imageUrl;
    data['name'] = name;
    data['kilometers'] = kilometers;
    data['date'] = date;
    data['rate'] = rate;
    data['price'] = price;
    return data;
  }
}
