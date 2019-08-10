
class RuleEntity {
  String rule;
  String privacy;

  RuleEntity({this.rule,this.privacy});

  RuleEntity.fromJson(Map<String, dynamic> json) {
    rule = json['rule'];
    privacy = json['privacy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rule'] = this.rule;
    data['privacy'] = this.privacy;
    return data;
  }
  @override
  String toString() {
    return 'InvitationEntity{rule: $rule,privacy:$privacy}';
  }
}