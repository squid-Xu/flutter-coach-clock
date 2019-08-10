
//学员进度
import 'Progress.dart';

class StuProgress {
  int stuId;
  String stuName;
  int stuGender;
  int stuBirthYear;
  int stuAge;
  String className;
  int classTimes;
  String packageName;
  String gifts;
  List<ProgressesEntity> progresses;

  StuProgress(
      {this.stuId,
        this.stuName,
        this.stuGender,
        this.stuBirthYear,
        this.stuAge,
        this.className,
        this.classTimes,
        this.packageName,
        this.gifts,
        this.progresses});

  StuProgress.fromJson(Map<String, dynamic> json) {
    stuId = json['stuId'];
    stuName = json['stuName'];
    stuGender = json['stuGender'];
    stuBirthYear = json['stuBirthYear'];
    stuAge = json['stuAge'];
    className = json['className'];
    classTimes = json['classTimes'];
    packageName = json['packageName'];
    gifts = json['gifts'];
    if (json['progresses'] != null) {
      progresses = new List<ProgressesEntity>();
      json['progresses'].forEach((v) {
        progresses.add(new ProgressesEntity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stuId'] = this.stuId;
    data['stuName'] = this.stuName;
    data['stuGender'] = this.stuGender;
    data['stuBirthYear'] = this.stuBirthYear;
    data['stuAge'] = this.stuAge;
    data['className'] = this.className;
    data['classTimes'] = this.classTimes;
    data['packageName'] = this.packageName;
    data['gifts'] = this.gifts;
    if (this.progresses != null) {
      data['progresses'] = this.progresses.map((v) => v.toJson()).toList();
    }
    return data;
  }
  @override
  String toString() {
    return 'InvitationEntity{stuId: $stuId, stuName: $stuName, stuGender: $stuGender, '
        'stuBirthYear: $stuBirthYear, stuAge: $stuAge, className: $className, classTimes: $classTimes, '
        'packageName: $packageName, gifts: $gifts,progresses:$progresses}';
  }
}