
//学员列表
class StudentInfoList {
  int stuId;
  int signupNumber;
  String stuName;
  int totalClassTimes;
  int leftClassTimes;
  int packageId;
  int clubId;
  String createTime;
  int coachId;
  String stuNumber;
  int stuPunchCount;
  int stuProgressCount;

  StudentInfoList(
      {this.stuId,
        this.signupNumber,
        this.stuName,
        this.totalClassTimes,
        this.leftClassTimes,
        this.packageId,
        this.clubId,
        this.createTime,
        this.coachId,
        this.stuNumber,
      this.stuPunchCount,
      this.stuProgressCount});

  StudentInfoList.fromJson(Map<String, dynamic> json) {
    stuId = json['stuId'];
    signupNumber = json['signupNumber'];
    stuName = json['stuName'];
    totalClassTimes = json['totalClassTimes'];
    leftClassTimes = json['leftClassTimes'];
    packageId = json['packageId'];
    clubId = json['clubId'];
    createTime = json['createTime'];
    coachId = json['coachId'];
    stuNumber = json['stuNumber'];
    stuPunchCount=json['stuPunchCount'];
    stuProgressCount=json['stuProgressCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stuId'] = this.stuId;
    data['signupNumber'] = this.signupNumber;
    data['stuName'] = this.stuName;
    data['totalClassTimes'] = this.totalClassTimes;
    data['leftClassTimes'] = this.leftClassTimes;
    data['packageId'] = this.packageId;
    data['clubId'] = this.clubId;
    data['createTime'] = this.createTime;
    data['coachId'] = this.coachId;
    data['stuNumber'] = this.stuNumber;
    data['stuPunchCount']=this.stuPunchCount;
    data['stuProgressCount']=this.stuProgressCount;
    return data;
  }
  @override
  String toString() {
    return 'InvitationEntity{stuId: $stuId, signupNumber: $signupNumber, stuName: $stuName, '
        'totalClassTimes: $totalClassTimes, leftClassTimes: $leftClassTimes, packageId: $packageId, clubId: $clubId, '
        'createTime: $createTime, coachId: $coachId, stuNumber: $stuNumber,stuPunchCount:$stuPunchCount,stuProgressCount:$stuProgressCount}';
  }
}