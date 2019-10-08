
class NewTokenEntity{

  String jwt;
  String retryToken;

  NewTokenEntity({this.jwt,this.retryToken});

  NewTokenEntity.fromJson(Map<String, dynamic> json){
    jwt = json['jwt'];
    retryToken = json['retryToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jwt'] = jwt;
    data['retryToken'] = retryToken;
  }

  @override
  String toString() {
    return 'NewTokenEntity{jwt: $jwt, retryToken: $retryToken}';
  }


}