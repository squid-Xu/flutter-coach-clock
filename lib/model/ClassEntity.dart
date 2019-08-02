
/// 课程
class ClassEntity {
  int classId;
  String className;
  String classContent;
  int classTimes;
  String classLabels;
  String classPic;
  String createTime;
  String updateTime;
  int clubAccountId;
  int state;
  int clubId;

  ClassEntity(
      {this.classId,
        this.className,
        this.classContent,
        this.classTimes,
        this.classLabels,
        this.classPic,
        this.createTime,
        this.updateTime,
        this.clubAccountId,
        this.state,
        this.clubId});

  ClassEntity.fromJson(Map<String, dynamic> json) {
    classId = json['classId'];
    className = json['className'];
    classContent = json['classContent'];
    classTimes = json['classTimes'];
    classLabels = json['classLabels'];
    classPic = json['classPic'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    clubAccountId = json['clubAccountId'];
    state = json['state'];
    clubId = json['clubId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classId'] = this.classId;
    data['className'] = this.className;
    data['classContent'] = this.classContent;
    data['classTimes'] = this.classTimes;
    data['classLabels'] = this.classLabels;
    data['classPic'] = this.classPic;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['clubAccountId'] = this.clubAccountId;
    data['state'] = this.state;
    data['clubId'] = this.clubId;
    return data;
  }
}