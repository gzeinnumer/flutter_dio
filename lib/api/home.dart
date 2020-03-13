import 'package:flutter/material.dart';
import 'package:flutterdio/api/api_repository.dart';
import 'package:flutterdio/api/model/model_post/model_post.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiRepository _apiRepository = ApiRepository();

  @override
  void initState() {
    _apiRepository.getDataPostFromApi;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _apiRepository.getDataPostFromApi,
          builder: (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                break;
              case ConnectionState.waiting:
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                break;
              case ConnectionState.active:
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                break;
              case ConnectionState.done:
                if(snapshot.hasError){
                  return Container(
                    child: Center(
                      child: Text("Ada yang salah"),
                    ),
                  );
                } else{
                  return BuildList(listData: snapshot.data,);
                }
                break;
            }
            return Container();
          }
        ),
      ),
    );
  }
}

class BuildList extends StatelessWidget {

  final List<PostModel> listData;
  const BuildList({
    Key key,
    this.listData
  }): super(key:key);

//  [
//    {
//      "userId": 1,
//      "id": 1,
//      "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//      "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
//    }
//  ]

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(listData[index].title),
            subtitle: Text(listData[index].body),
          );
        }
      ),
    );
  }
}
