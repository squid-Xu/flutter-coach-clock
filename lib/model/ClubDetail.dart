//俱乐部信息
class ClubDetail {
  int id;
  String clubName;
  String clubAddress;
  String clubMobile;
  String labels;
  String introduction;
  String clubLogo;
  int state;
  String createTime;
  String updateTime;
  String province;
  String city;
  String region;
  int signupCount;
  int progressStuCount;
  String clubJingwei;
  String classAddress;
  String onlineTime;
  String offlineTime;
  int clubAccount;
  String accountMobile;
  dynamic packageEntities;
  dynamic coachInfoEntities;

  ClubDetail(
      {this.id,
        this.clubName,
        this.clubAddress,
        this.clubMobile,
        this.labels,
        this.introduction,
        this.clubLogo,
        this.state,
        this.createTime,
        this.updateTime,
        this.province,
        this.city,
        this.region,
        this.signupCount,
        this.progressStuCount,
        this.clubJingwei,
        this.classAddress,
        this.onlineTime,
        this.offlineTime,
        this.clubAccount,
        this.accountMobile,
        this.packageEntities,
        this.coachInfoEntities});

  ClubDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clubName = json['clubName'];
    clubAddress = json['clubAddress'];
    clubMobile = json['clubMobile'];
    labels = json['labels'];
    introduction = json['introduction'];
    clubLogo = json['clubLogo'];
    state = json['state'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    province = json['province'];
    city = json['city'];
    region = json['region'];
    signupCount = json['signupCount'];
    progressStuCount = json['progressStuCount'];
    clubJingwei = json['clubJingwei'];
    classAddress = json['classAddress'];
    onlineTime = json['onlineTime'];
    offlineTime = json['offlineTime'];
    clubAccount = json['clubAccount'];
    accountMobile = json['accountMobile'];
    packageEntities = json['packageEntities'];
    coachInfoEntities = json['coachInfoEntities'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['clubName'] = this.clubName;
    data['clubAddress'] = this.clubAddress;
    data['clubMobile'] = this.clubMobile;
    data['labels'] = this.labels;
    data['introduction'] = this.introduction;
    data['clubLogo'] = this.clubLogo;
    data['state'] = this.state;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['province'] = this.province;
    data['city'] = this.city;
    data['region'] = this.region;
    data['signupCount'] = this.signupCount;
    data['progressStuCount'] = this.progressStuCount;
    data['clubJingwei'] = this.clubJingwei;
    data['classAddress'] = this.classAddress;
    data['onlineTime'] = this.onlineTime;
    data['offlineTime'] = this.offlineTime;
    data['clubAccount'] = this.clubAccount;
    data['accountMobile'] = this.accountMobile;
    data['packageEntities'] = this.packageEntities;
    data['coachInfoEntities'] = this.coachInfoEntities;
    return data;
  }
  @override
  String toString() {
    return 'InvitationEntity{id: $id, clubName: $clubName, clubAddress: $clubAddress, '
        'clubMobile: $clubMobile, labels: $labels, introduction: $introduction, clubLogo: $clubLogo, '
        'state: $state, createTime: $createTime, updateTime: $updateTime, '
        'province: $province,city: $city,，region: $region,signupCount: $signupCount,progressStuCount: $progressStuCount,'
        'clubJingwei: $clubJingwei,classAddress: $classAddress,onlineTime: $onlineTime,'
        'offlineTime: $offlineTime,clubAccount: $clubAccount,accountMobile: $accountMobile,'
        'packageEntities: $packageEntities,coachInfoEntities: $coachInfoEntities,}';
  }
}
