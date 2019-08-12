import 'package:coach/model/studentInfo.dart';

class StudentEntity {
  List<StudentInfoList> data;
  int count;

  StudentEntity({ this.data, this.count});

  StudentEntity.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<StudentInfoList>();
      json['data'].forEach((v) {
        data.add(new StudentInfoList.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
  @override
  String toString() {
    return 'InvitationEntity{data: $data, count: $count}';
  }
}
