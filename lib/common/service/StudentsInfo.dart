import 'package:coach/common/config/base_config.dart';
import 'package:coach/common/net/api.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/model/StuProgress.dart';
import 'package:coach/model/students.dart';
import 'package:dio/dio.dart';


//学员列表
class StudentsService {

  //全部学员
  static Future<StudentEntity> getStudentList(String stuname) async {
    Map<String, dynamic> requestMap = {"stuName": stuname!=null ? stuname: ''};

    Map<String, dynamic> res = await httpManager.netFetch(
        BaseConfig.BASE_URL + '/stu/list', requestMap, null);
    if (res['code'] == 0) {
      if (res['data'] == null) {
        return null;
      }else{
        StudentEntity studentEntity = StudentEntity.fromJson(res);
        return studentEntity;
      }
    } else {
//      GlobalToast.globalToast(res['msg']);
      return null;
    }
  }

  //学员详情
  static Future<StuProgress> stuInfo(int stuId) async {

    Map<String, dynamic> requestMap = {
      "stuId":stuId
    };
    Map<String, dynamic> res = await httpManager.netFetch(BaseConfig.BASE_URL+'/stu/info', requestMap, null);
    if(res['code'] != 0){
      GlobalToast.globalToast(res['msg']);
      return null;
    }
    StuProgress stuProEntity = StuProgress.fromJson(res['data']);
    return stuProEntity;

  }

  //更新进度
  static Future<bool> stuUpdate({int stuId,String content }) async{
    Map<String, dynamic> requestMap = {
      "stuId": stuId,
      "content": content
    };
    Map<String, dynamic> res = await httpManager.netFetch(BaseConfig.BASE_URL+'/stu/update',
        requestMap, new Options(method: 'post'));
    if(res['code'] != 0){
      GlobalToast.globalToast(res['msg']);
      return false;
    }
    return true;
  }

}
