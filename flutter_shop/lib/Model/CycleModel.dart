class CycleModel {
  String extLink;
  String path;
  String obj;
  String title;
  String arouter;
  int carouselNum;

  CycleModel(
      {this.extLink,
        this.path,
        this.obj,
        this.title,
        this.arouter,
        this.carouselNum});

  CycleModel.fromJson(Map<String, dynamic> json) {
    extLink = json['extLink'];
    path = json['path'];
    obj = json['obj'];
    title = json['title'];
    arouter = json['arouter'];
    carouselNum = json['carouselNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['extLink'] = this.extLink;
    data['path'] = this.path;
    data['obj'] = this.obj;
    data['title'] = this.title;
    data['arouter'] = this.arouter;
    data['carouselNum'] = this.carouselNum;
    return data;
  }
}
