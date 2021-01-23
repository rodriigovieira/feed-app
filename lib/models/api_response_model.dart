class ApiResponseModel {
  String category;
  List<Items> items;

  ApiResponseModel({this.category, this.items});

  ApiResponseModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String title;
  String description;
  List<String> galery;

  Items({this.title, this.description, this.galery});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    galery = json['galery'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['galery'] = this.galery;
    return data;
  }
}