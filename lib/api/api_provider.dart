import 'dart:convert';

import 'package:dio/dio.dart' as http_dio;
import 'package:flutterdio/api/model/model_post/model_post.dart';

class ApiProvider{
  http_dio.Dio dio = new http_dio.Dio();
  Future<List<PostModel>> getDataPostFromApiAsyn() async{
    http_dio.Response response = await dio.get("https://jsonplaceholder.typicode.com/posts");
//    print(response.data);
//    print(response.statusCode);
    if(response.statusCode == 200){
      final List rawData = jsonDecode(jsonEncode(response.data));
//    print(rawData.length); //output 100
      List<PostModel> listPostModel = rawData.map((f)=>PostModel.fromJson(f)).toList();
    print(listPostModel.length); //output 100
      return listPostModel;
    } else {
      return null;
    }
  }
}