import 'package:coach/common/config/base_config.dart';
import 'package:coach/common/net/api.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/model/studentInfo.dart';


//学员列表
class StudentsService {
  static Future<List<StudentInfoList>> getStudentList(String stuname) async {
    Map<String, dynamic> requestMap = {"stuName": stuname!=null ? stuname: ""};

    Map<String, dynamic> res = await httpManager.netFetch(
        BaseConfig.BASE_URL + '/stu/list', requestMap, null);
    if (res['code'] == 0) {
      if (res['data'] == null) {
        return null;
      }else{
        List<StudentInfoList> stuList = new List();
        for( var entity in res['data']){
          stuList.add(StudentInfoList.fromJson(entity));
        }
        print("map:${stuList}");
        return stuList;
      }
    } else {
      GlobalToast.globalToast(res['msg']);
      return null;
    }
  }
}
