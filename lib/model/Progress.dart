//学员全部进度
class ProgressesEntity {
  int progressId;
  int stuId;
  int coachId;
  int classTimesNum;
  String content;
  String createTime;
  String stuName;
  String className;
  int totalClassTimes;
  String coachName;

  ProgressesEntity({this.progressId,
    this.stuId,
    this.coachId,
    this.classTimesNum,
    this.content,
    this.createTime,
    this.stuName,
    this.className,
    this.totalClassTimes,
    this.coachName});

  ProgressesEntity.fromJson(Map<String, dynamic> json) {
    progressId = json['progressId'];
    stuId = json['stuId'];
    coachId = json['coachId'];
    classTimesNum = json['classTimesNum'];
    content = json['content'];
    createTime = json['createTime'];
    stuName = json['stuName'];
    className = json['className'];
    totalClassTimes = json['totalClassTimes'];
    coachName = json['coachName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['progressId'] = this.progressId;
    data['stuId'] = this.stuId;
    data['coachId'] = this.coachId;
    data['classTimesNum'] = this.classTimesNum;
    data['content'] = this.content;
    data['createTime'] = this.createTime;
    data['stuName'] = this.stuName;
    data['className'] = this.className;
    data['totalClassTimes'] = this.totalClassTimes;
    data['coachName'] = this.coachName;
    return data;
  }
  @override
  String toString() {
    return 'InvitationEntity{progressId: $progressId, stuId: $stuId, coachId: $coachId, '
        'classTimesNum: $classTimesNum, content: $content, createTime: $createTime, stuName: $stuName, '
        'className: $className, totalClassTimes: $totalClassTimes,coachName: $coachName}';
  }
}