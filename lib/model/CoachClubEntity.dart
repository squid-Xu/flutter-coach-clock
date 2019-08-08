
//教练所属俱乐部信息
import 'ClubDetail.dart';

class CoachClubEntity {
  int coachId;
  String coachName;
  String coachLabels;
  String selfIntroduce;
  String showImg;
  int teachingAge;
  int userId;
  int clubId;
  int isShow;
  String coachLevel;
  double coachSalary;
  String updateTime;
  //俱乐部信息
  ClubDetail clubInfoEntity ;
  String mobile;
  String nickName;
  String username;

  CoachClubEntity(
      {this.coachId,
        this.coachName,
        this.coachLabels,
        this.selfIntroduce,
        this.showImg,
        this.teachingAge,
        this.userId,
        this.clubId,
        this.isShow,
        this.coachLevel,
        this.coachSalary,
        this.updateTime,
        this.clubInfoEntity,
        this.mobile,
        this.nickName,
        this.username});

  CoachClubEntity.fromJson(Map<String, dynamic> json) {
    coachId = json['coachId'];
    coachName = json['coachName'];
    coachLabels = json['coachLabels'];
    selfIntroduce = json['selfIntroduce'];
    showImg = json['showImg'];
    teachingAge = json['teachingAge'];
    userId = json['userId'];
    clubId = json['clubId'];
    isShow = json['isShow'];
    coachLevel = json['coachLevel'];
    coachSalary = json['coachSalary'];
    updateTime = json['updateTime'];
    clubInfoEntity = json['clubInfoEntity'] != null
        ? new ClubDetail.fromJson(json['clubInfoEntity'])
        : null;
    mobile = json['mobile'];
    nickName = json['nickName'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coachId'] = this.coachId;
    data['coachName'] = this.coachName;
    data['coachLabels'] = this.coachLabels;
    data['selfIntroduce'] = this.selfIntroduce;
    data['showImg'] = this.showImg;
    data['teachingAge'] = this.teachingAge;
    data['userId'] = this.userId;
    data['clubId'] = this.clubId;
    data['isShow'] = this.isShow;
    data['coachLevel'] = this.coachLevel;
    data['coachSalary'] = this.coachSalary;
    data['updateTime'] = this.updateTime;
    if (this.clubInfoEntity != null) {
      data['clubInfoEntity'] = this.clubInfoEntity.toJson();
    }
    data['mobile'] = this.mobile;
    data['nickName'] = this.nickName;
    data['username'] = this.username;
    return data;
  }
  @override
  String toString() {
    return 'InvitationEntity{coachId: $coachId, coachName: $coachName, coachLabels: $coachLabels, '
        'selfIntroduce: $selfIntroduce, showImg: $showImg, teachingAge: $teachingAge, userId: $userId, '
        'clubId: $clubId, isShow: $isShow, coachLevel: $coachLevel, '
        'coachSalary: $coachSalary,updateTime: $updateTime,mobile: $mobile,nickName: $nickName,username: $username,'
        'clublist:$clubInfoEntity}';
  }
}
