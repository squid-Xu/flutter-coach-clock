class SweepEntivity {
  int stuId;
  int signupNumber;
  String stuName;
  String totalClassTimes;
  int leftClassTimes;
  int packageId;
  int clubId;
  String createTime;
  int coachId;
  String stuNumber;
  String updateTime;
  int stuPunchCount;
  int stuProgressCount;
  String className;
  int havePunch;
  int codeId;

  SweepEntivity(
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
        this.updateTime,
        this.stuPunchCount,
        this.stuProgressCount,
        this.className,
        this.havePunch,
        this.codeId});

  SweepEntivity.fromJson(Map<String, dynamic> json) {
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
    updateTime = json['updateTime'];
    stuPunchCount = json['stuPunchCount'];
    stuProgressCount = json['stuProgressCount'];
    className = json['className'];
    havePunch = json['havePunch'];
    codeId = json['codeId'];
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
    data['updateTime'] = this.updateTime;
    data['stuPunchCount'] = this.stuPunchCount;
    data['stuProgressCount'] = this.stuProgressCount;
    data['className'] = this.className;
    data['havePunch'] = this.havePunch;
    data['codeId'] = this.codeId;
    return data;
  }
  @override
  String toString() {
    return 'SweepEntivity{stuId: $stuId, stuName: $stuName, signupNumber: $signupNumber, '
        'totalClassTimes: $totalClassTimes, leftClassTimes: $leftClassTimes, packageId: $packageId, clubId: $clubId, '
        'createTime: $createTime, coachId: $coachId,stuNumber:$stuNumber,'
        'updateTime:$updateTime,stuPunchCount:$stuPunchCount,stuProgressCount:$stuProgressCount,className:$className,havePunch:$havePunch,codeId:$codeId}';
  }
}