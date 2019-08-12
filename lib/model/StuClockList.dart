//学员打卡列表
class StuClockEntity {
  int stuId;
  String stuName;
  String stuNumber;
  int isPunch;

  StuClockEntity({this.stuId, this.stuName, this.stuNumber, this.isPunch});

  StuClockEntity.fromJson(Map<String, dynamic> json) {
    stuId = json['stuId'];
    stuName = json['stuName'];
    stuNumber = json['stuNumber'];
    isPunch = json['isPunch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stuId'] = this.stuId;
    data['stuName'] = this.stuName;
    data['stuNumber'] = this.stuNumber;
    data['isPunch'] = this.isPunch;
    return data;
  }
  @override
  String toString() {
    return 'InvitationEntity{stuId: $stuId, stuName: $stuName, stuNumber: $stuNumber, '
        'isPunch: $isPunch}';
  }
}