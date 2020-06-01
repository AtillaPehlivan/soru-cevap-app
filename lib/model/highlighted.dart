class Highlighted {
  int id;
  String image;
  String title;
  Tag tag;

  Highlighted({this.id, this.image, this.title, this.tag});

  Highlighted.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    tag = json['tag'] != null ? new Tag.fromJson(json['tag']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    if (this.tag != null) {
      data['tag'] = this.tag.toJson();
    }
    return data;
  }
}

class Tag {
  String name;
  int id;

  Tag({this.name, this.id});

  Tag.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}