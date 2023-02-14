
import 'package:dio/dio.dart' as dio;

enum DioType{post,get}

class DioMethod{

  static final  d = dio.Dio();

  static Future<dio.Response> methodhandler(
    {
      DioType ? type,
      String? url,
      dynamic data
    }
  ) async{

    if(type == DioType.post){

      final response = await d.post(url!,data: data,options: dio.Options(
        headers: {
          "Accept":"application/json",
          "Content-Type":"application/json"
        }
      ));
      return response;
    }else{
   
      final response = await d.get(url!);
      return response;
    }

  }

}