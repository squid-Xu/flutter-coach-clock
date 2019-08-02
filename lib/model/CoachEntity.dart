
/// 教练信息
class CoachEntity {

  int coachId;
  String coachLabels;
  String selfIntroduce;
  String showImg;
  int teachingAge;
  int userId;
  int clubId;
  int isShow;
  String updateTime;
  String clubInfoEntity;
  String mobile;
  String nickName;
  String username;

  CoachEntity(
      {this.coachId,
        this.coachLabels,
        this.selfIntroduce,
        this.showImg,
        this.teachingAge,
        this.userId,
        this.clubId,
        this.isShow,
        this.updateTime,
        this.clubInfoEntity,
        this.mobile,
        this.nickName,
        this.username});

  CoachEntity.fromJson(Map<String, dynamic> json) {
    coachId = json['coachId'];
    coachLabels = json['coachLabels'];
    selfIntroduce = json['selfIntroduce'];
    showImg = json['showImg'];
    teachingAge = json['teachingAge'];
    userId = json['userId'];
    clubId = json['clubId'];
    isShow = json['isShow'];
    updateTime = json['updateTime'];
    clubInfoEntity = json['clubInfoEntity'];
    mobile = json['mobile'];
    nickName = json['nickName'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coachId'] = this.coachId;
    data['coachLabels'] = this.coachLabels;
    data['selfIntroduce'] = this.selfIntroduce;
    data['showImg'] = this.showImg;
    data['teachingAge'] = this.teachingAge;
    data['userId'] = this.userId;
    data['clubId'] = this.clubId;
    data['isShow'] = this.isShow;
    data['updateTime'] = this.updateTime;
    data['clubInfoEntity'] = this.clubInfoEntity;
    data['mobile'] = this.mobile;
    data['nickName'] = this.nickName;
    data['username'] = this.username;
    return data;
  }

  @override
  String toString() {
    return 'CoachEntity{coachId: $coachId, coachLabels: $coachLabels, selfIntroduce: $selfIntroduce, showImg: $showImg, teachingAge: $teachingAge, userId: $userId, clubId: $clubId, isShow: $isShow, updateTime: $updateTime, clubInfoEntity: $clubInfoEntity, mobile: $mobile, nickName: $nickName, username: $username}';
  }


}