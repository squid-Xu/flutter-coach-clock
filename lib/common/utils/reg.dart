
/// 正则校验
class GlobalRegExp {
  /// 手机号校验
  ///大陆手机号码11位数，匹配格式：前三位固定格式+后8位任意数
  /// 此方法中前三位格式有：
  /// 13+任意数 * 15+除4的任意数 * 18+除1和4的任意数 * 17+除9的任意数 * 147
  static bool isChinaPhoneLegal(String str) {
    return new RegExp('^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$').hasMatch(str);
  }

  /// 密码校验
  /// 6~16位数字和字符组合
  static bool isPassword(String str){
    RegExp regExp = new RegExp(r"(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$");
    bool res = regExp.hasMatch(str);
    print("校验密码：$str，结果：$res");
    return res;
  }
}