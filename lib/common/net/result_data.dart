/**
 * 网络请求结果
 */
class ResultData{

  var data;
  bool result;
  int code;
  String msg;
  var headers;

  ResultData(this.data, this.result, this.code, {this.headers});

}