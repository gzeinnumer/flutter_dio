import 'package:flutterdio/api/api_provider.dart';
import 'package:flutterdio/api/model/model_post/model_post.dart';

class ApiRepository{
  ApiProvider _provider = ApiProvider();

  Future<List<PostModel>> get getDataPostFromApi => _provider.getDataPostFromApiAsyn();
}