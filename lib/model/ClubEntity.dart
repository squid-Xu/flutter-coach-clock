import 'CoachEntity.dart';
import 'PackageEntity.dart';

/// 俱乐部信息
class ClubEntity {
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
  String classAddress;
  String onlineTime;
  String offlineTime;
  String clubAccount;
  String accountMobile;
  // 套餐信息
  List<PackageEntity> packageList;
  // 教练员信息
  List<CoachEntity> coachList;

  int signupCount;

  ClubEntity(
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
        this.classAddress,
        this.onlineTime,
        this.offlineTime,
        this.clubAccount,
        this.accountMobile,
        this.packageList,
        this.coachList,
        this.signupCount
      });

  ClubEntity.fromJson(Map<String, dynamic> json) {
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
    classAddress = json['classAddress'];
    onlineTime = json['onlineTime'];
    offlineTime = json['offlineTime'];
    clubAccount = json['clubAccount'];
    accountMobile = json['accountMobile'];
    signupCount = json['signupCount'];
    if (json['packageEntities'] != null) {
      packageList = new List<PackageEntity>();
      json['packageEntities'].forEach((v) {
        packageList.add(new PackageEntity.fromJson(v));
      });
    }
    if (json['coachInfoEntities'] != null) {
      coachList = new List<CoachEntity>();
      json['coachInfoEntities'].forEach((v) {
        coachList.add(new CoachEntity.fromJson(v));
      });
    }
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
    data['classAddress'] = this.classAddress;
    data['onlineTime'] = this.onlineTime;
    data['offlineTime'] = this.offlineTime;
    data['clubAccount'] = this.clubAccount;
    data['accountMobile'] = this.accountMobile;
    data['signupCount'] = this.signupCount;
    if (this.packageList != null) {
      data['packageEntities'] =
          this.packageList.map((v) => v.toJson()).toList();
    }
    if (this.coachList != null) {
      data['coachInfoEntities'] =
          this.packageList.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'ClubEntity{id: $id, clubName: $clubName, clubAddress: $clubAddress,'
        ' clubMobile: $clubMobile, labels: $labels, introduction: $introduction,'
        ' clubLogo: $clubLogo, state: $state, createTime: $createTime, '
        'updateTime: $updateTime, province: $province, city: $city, region: $region, '
        'classAddress: $classAddress, onlineTime: $onlineTime, offlineTime: $offlineTime,'
        ' clubAccount: $clubAccount, accountMobile: $accountMobile, packageList: $packageList, '
        'coachList: $coachList}, signupCount: $signupCount';
  }


}