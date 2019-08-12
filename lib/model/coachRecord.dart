
//教练打卡记录
class CoachRecordEntity {
  int coachPunchId;
  int coachId;
  int clubId;
  String punchDate;
  String startWorkTime;
  String offWorkTime;
  String startPunchAddress;
  String offPunchAddress;
  int stuPunchCount;

  CoachRecordEntity(
      {this.coachPunchId,
        this.coachId,
        this.clubId,
        this.punchDate,
        this.startWorkTime,
        this.offWorkTime,
        this.startPunchAddress,
        this.offPunchAddress,
        this.stuPunchCount});

  CoachRecordEntity.fromJson(Map<String, dynamic> json) {
    coachPunchId = json['coachPunchId'];
    coachId = json['coachId'];
    clubId = json['clubId'];
    punchDate = json['punchDate'];
    startWorkTime = json['startWorkTime'];
    offWorkTime = json['offWorkTime'];
    startPunchAddress = json['startPunchAddress'];
    offPunchAddress = json['offPunchAddress'];
    stuPunchCount = json['stuPunchCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coachPunchId'] = this.coachPunchId;
    data['coachId'] = this.coachId;
    data['clubId'] = this.clubId;
    data['punchDate'] = this.punchDate;
    data['startWorkTime'] = this.startWorkTime;
    data['offWorkTime'] = this.offWorkTime;
    data['startPunchAddress'] = this.startPunchAddress;
    data['offPunchAddress'] = this.offPunchAddress;
    data['stuPunchCount'] = this.stuPunchCount;
    return data;
  }
  String toString() {
    return 'InvitationEntity{coachPunchId: $coachPunchId, coachId: $coachId, clubId: $clubId, '
        'punchDate: $punchDate, startWorkTime: $startWorkTime, offWorkTime: $offWorkTime, startPunchAddress: $startPunchAddress, '
        'offPunchAddress: $offPunchAddress, stuPunchCount: $stuPunchCount}';
  }
}