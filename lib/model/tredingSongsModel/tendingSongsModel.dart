class TrendingSongs {
  String? id;
  String? title;
  String? discription;
  String? singer;
  String? thumbnail;
  String? fileName;

  TrendingSongs(
      {this.id,
      this.title,
      this.discription,
      this.singer,
      this.thumbnail,
      this.fileName});

  TrendingSongs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    discription = json['discription'];
    singer = json['singer'];
    thumbnail = json['thumbnail'];
    fileName = json['file_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id ?? "";
    data['title'] = this.title ?? "";
    data['discription'] = this.discription ?? "";
    data['singer'] = this.singer ?? "";
    data['thumbnail'] = this.thumbnail ?? "";
    data['file_name'] = this.fileName ?? "";
    return data;
  }
}
