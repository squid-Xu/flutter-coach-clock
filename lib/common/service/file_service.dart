
import 'package:coach/common/config/base_config.dart';
import 'package:coach/common/net/api.dart';
import 'package:dio/dio.dart';
import 'package:coach/common/utils/global_toast.dart';

class FileService{

  // 上传图片
  static Future<String> uploadImage(UploadFileInfo file) async {

    FormData formData = new FormData.from({
      "file": file
    });

    Map<String, dynamic> res = await httpManager.netFetch(BaseConfig.BASE_URL+'/oss/upload/img', formData,  new Options(method: 'post'));
    if(res['code'] != 0){
      GlobalToast.globalToast(res['msg']);
      return null;
    }
    print("res:${res['url']}");
    if(res !=null && res['url'] != null){
      return res['url'];
    }

  }

}