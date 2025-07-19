// class UserDetail {
//   String? name;
//   String? lastname;
//   String? age;

//   UserDetail({this.name, this.lastname, this.age});

//   UserDetail.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     lastname = json['lastname'];
//     age = json['age'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['lastname'] = this.lastname;
//     data['age'] = this.age;
//     return data;
//   }
// }
class UserDetail {
  var success;

  UserDetail({this.success});

  UserDetail.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Success'] = this.success;
    return data;
  }
}
