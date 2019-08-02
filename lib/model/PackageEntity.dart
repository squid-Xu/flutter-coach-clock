
/// 套餐信息
class PackageEntity {
  int packageId;
  String packageName;
  double originalPrice;
  double sellingPrice;
  String packagePic;
  int signUpNum;
  String createTime;
  String updateTime;
  int state;
  int clubId;
  int classId;
  String onlineTime;
  int clubAccountId;
  String gifts;
  String classLabels;

  PackageEntity(
      {this.packageId,
        this.packageName,
        this.originalPrice,
        this.sellingPrice,
        this.packagePic,
        this.signUpNum,
        this.createTime,
        this.updateTime,
        this.state,
        this.clubId,
        this.classId,
        this.onlineTime,
        this.clubAccountId,
        this.gifts,
        this.classLabels});

  PackageEntity.fromJson(Map<String, dynamic> json) {
    packageId = json['packageId'];
    packageName = json['packageName'];
    originalPrice = json['originalPrice'];
    sellingPrice = json['sellingPrice'];
    packagePic = json['packagePic'];
    signUpNum = json['signUpNum'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    state = json['state'];
    clubId = json['clubId'];
    classId = json['classId'];
    onlineTime = json['onlineTime'];
    clubAccountId = json['clubAccountId'];
    gifts = json['gifts'];
    classLabels = json['classLabels'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['packageId'] = this.packageId;
    data['packageName'] = this.packageName;
    data['originalPrice'] = this.originalPrice;
    data['sellingPrice'] = this.sellingPrice;
    data['packagePic'] = this.packagePic;
    data['signUpNum'] = this.signUpNum;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['state'] = this.state;
    data['clubId'] = this.clubId;
    data['classId'] = this.classId;
    data['onlineTime'] = this.onlineTime;
    data['clubAccountId'] = this.clubAccountId;
    data['gifts'] = this.gifts;
    data['classLabels'] = this.classLabels;
    return data;
  }

  @override
  String toString() {
    return 'PackageEntity{packageId: $packageId, packageName: $packageName, '
        'originalPrice: $originalPrice, sellingPrice: $sellingPrice, '
        'packagePic: $packagePic, signUpNum: $signUpNum, '
        'createTime: $createTime, updateTime: $updateTime, state: $state, '
        'clubId: $clubId, classId: $classId, onlineTime: $onlineTime, '
        'clubAccountId: $clubAccountId, gifts: $gifts, classLabels: $classLabels}';
  }


}