import 'package:activelamp/services/services.dart';
import 'package:dio/dio.dart';

class ApiServiceShortener{

  
  static Future<Response> shortenLink({dynamic data}) async{
  
    final response = await DioMethod.methodhandler(
      type: DioType.post,
     
      url: ApiString.baseUrl,
      data: data
    );
    
    return response;
  }
  
}