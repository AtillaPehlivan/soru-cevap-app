class UserAskedQuestion {
  int id;
  String title;
  Tag tag;
  String time;
  String description;
  String status;
  String image;
  DateTime date;

  UserAskedQuestion({this.id, this.title, this.tag, this.time, this.description, this.status,this.image, this.date});

  UserAskedQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    tag = json['tag'] != null ? new Tag.fromJson(json['tag']) : null;
    time = json['time'];
    description = json['description'];
    status = json['status'];
    image = json['question']['image'];
    date = DateTime.parse(json['date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.tag != null) {
      data['tag'] = this.tag.toJson();
    }
    data['time'] = this.time;
    data['description'] = this.description;
    data['status'] = this.status;
    data['image'] = this.image;
    data['date'] = this.date.toString();
    return data;
  }
}

class Tag {
  String name;

  Tag({this.name});

  Tag.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
