
/// 用户信息
class UserInfo {
  // 用户名
  String username;
  // 手机号
  String mobile;
  // 昵称
  String nickName;
  // 性别
  int gender;
  // 所在省
  String province;
  // 所在市
  String city;
  // 所在区县
  String region;
  // 头像
  String avatar;
  // 注册时间
  String createTime;
  // 个性签名
  String signature;
  // jwt token
  String jwtToken;
  // token过期时间
  int expire;
  // 重新获取token
  String retryToken;
  // 是否有密码
  bool havePwd = false;

  UserInfo(
      {this.username,
        this.mobile,
        this.nickName,
        this.gender,
        this.province,
        this.city,
        this.region,
        this.avatar,
        this.createTime,
        this.signature,
        this.jwtToken,
        this.expire,
        this.retryToken,
      this.havePwd});

  UserInfo.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    mobile = json['mobile'];
    nickName = json['nickName'];
    gender = json['gender'];
    province =json['province'];
    city =json['city'];
    region = json['region'];
    avatar = json['avatar'];
    createTime = json['createTime'];
    signature = json['signature'];
    jwtToken = json['jwtToken'];
    expire = json['expire'];
    retryToken = json['retryToken'];
    havePwd = json['havePwd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['mobile'] = this.mobile;
    data['nickName'] = this.nickName;
    data['gender'] = this.gender;
    data['province'] = this.province;
    data['city'] = this.city;
    data['region'] = this.region;
    data['avatar'] = this.avatar;
    data['createTime'] = this.createTime;
    data['signature'] = this.signature;
    data['jwtToken'] = this.jwtToken;
    data['expire'] = this.expire;
    data['retryToken'] = this.retryToken;
    data['havePwd'] = this.havePwd;
    return data;
  }

  @override
  String toString() {
    return 'UserInfo{username: $username, mobile: $mobile, nickName: $nickName, '
        'gender: $gender, province: $province, city: $city, region: $region, '
        'avatar: $avatar, createTime: $createTime, signature: $signature, '
        'jwtToken: $jwtToken, expire: $expire, retryToken: $retryToken, havePwd: $havePwd}';
  }


}