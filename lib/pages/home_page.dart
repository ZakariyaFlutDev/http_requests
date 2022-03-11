import 'package:flutter/material.dart';
import 'package:http_requests/model/post_model.dart';
import 'package:http_requests/services/http_service.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late String data;

  _showResponse(String response){
    setState(() {
      data = response;
    });
  }

  void _apiPostList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  void _apiPostCreate(Post post){
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {
      _showResponse(response!),
    });
  }

  void _apiPostUpdate(Post post){
    Network.PUT(Network.API_UPDATE+post.id.toString(), Network.paramsUpdate(post)).then((response) => {
      _showResponse(response!),
    });
  }

  void _apiPostDelete(Post post){
    Network.DEL(Network.API_DELETE+post.id.toString(), Network.paramsEmpty()).then((response) => {
      _showResponse(response!),
      print(response),
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();

    var post = new Post(id: 1, title: "Zakariya", body: "FlutDev", userId: 11);
    // _apiPostCreate(post);
    // _apiPostUpdate(post);
    // _apiPostDelete(post);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data : "No Data"),
      ),
    );
  }


}
