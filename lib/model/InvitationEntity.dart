//个人邀请
class InvitationEntity {
  int applyId;
  String clubId;
  String userId;
  int applyState;
  String applyTime;
  String applyMsg;
  String replyTime;
  String replyMsg;
  String mobile;
  String nickName;
  String clubName;
  String clubLogo;

  InvitationEntity(
      {this.applyId,
        this.clubId,
        this.userId,
        this.applyState,
        this.applyTime,
        this.applyMsg,
        this.replyTime,
        this.replyMsg,
        this.mobile,
        this.nickName,
        this.clubName,
        this.clubLogo});

  InvitationEntity.fromJson(Map<String, dynamic> json) {
    applyId = json['applyId'];
    clubId = json['clubId'];
    userId = json['userId'];
    applyState = json['applyState'];
    applyTime = json['applyTime'];
    applyMsg = json['applyMsg'];
    replyTime = json['replyTime'];
    replyMsg = json['replyMsg'];
    mobile = json['mobile'];
    nickName = json['nickName'];
    clubName = json['clubName'];
    clubLogo = json['clubLogo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applyId'] = this.applyId;
    data['clubId'] = this.clubId;
    data['userId'] = this.userId;
    data['applyState'] = this.applyState;
    data['applyTime'] = this.applyTime;
    data['applyMsg'] = this.applyMsg;
    data['replyTime'] = this.replyTime;
    data['replyMsg'] = this.replyMsg;
    data['mobile'] = this.mobile;
    data['nickName'] = this.nickName;
    data['clubName'] = this.clubName;
    data['clubLogo'] = this.clubLogo;
    return data;
  }
  @override
  String toString() {
    return 'InvitationEntity{applyId: $applyId, clubId: $clubId, userId: $userId, '
        'applyState: $applyState, applyTime: $applyTime, applyMsg: $applyMsg, replyTime: $replyTime, '
        'replyMsg: $replyMsg, mobile: $mobile, nickName: $nickName, '
        'clubName: $clubName,clubLogo:$clubLogo}';
  }
}