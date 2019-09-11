class SweepRecodeEntivity {
  int stuPunchId;
  String punchTime;
  int stuId;
  int classTimesNum;
  String punchType;
  String punchAddress;
  int coachId;
  String stuName;
  String coachName;

  SweepRecodeEntivity(
      {this.stuPunchId,
        this.punchTime,
        this.stuId,
        this.classTimesNum,
        this.punchType,
        this.punchAddress,
        this.coachId,
        this.stuName,
        this.coachName});

  SweepRecodeEntivity.fromJson(Map<String, dynamic> json) {
    stuPunchId = json['stuPunchId'];
    punchTime = json['punchTime'];
    stuId = json['stuId'];
    classTimesNum = json['classTimesNum'];
    punchType = json['punchType'];
    punchAddress = json['punchAddress'];
    coachId = json['coachId'];
    stuName = json['stuName'];
    coachName = json['coachName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stuPunchId'] = this.stuPunchId;
    data['punchTime'] = this.punchTime;
    data['stuId'] = this.stuId;
    data['classTimesNum'] = this.classTimesNum;
    data['punchType'] = this.punchType;
    data['punchAddress'] = this.punchAddress;
    data['coachId'] = this.coachId;
    data['stuName'] = this.stuName;
    data['coachName'] = this.coachName;
    return data;
  }
  @override
  String toString() {
    return 'SweepRecodeEntivity{stuPunchId: $stuPunchId, punchTime: $punchTime, stuId: $stuId, '
        'classTimesNum: $classTimesNum, punchType: $punchType, punchAddress: $punchAddress, coachId: $coachId, '
        'stuName: $stuName, coachName: $coachName,}';
  }
}