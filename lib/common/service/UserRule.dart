import 'package:coach/model/rule.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

class RuleService {


// 将 json 字符串解析为 Person 对象
 static Future<RuleEntity> decodePerson() async {
    // 获取本地的 json 字符串
    String personJson = await rootBundle.loadString('images/rule.json');

    // 解析 json 字符串，返回的是 Map<String, dynamic> 类型
    final jsonMap = json.decode(personJson);

    RuleEntity ruledetail = RuleEntity.fromJson(jsonMap);

    return ruledetail;
  }
}
