import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class App extends StatefulWidget
{
  _App createState(){
    return _App();
  }
}
class ImageModel
{
  int id;
  String url;
  String title;

  ImageModel(this.id, this.url, this.title);

  ImageModel.fromJson(Map<String, dynamic> parsedJson){
    id = parsedJson['id'];
    url = parsedJson['url'];
    title = parsedJson['title'];
  }
}
class _App extends State<App>
{
  List<Widget> images = [];
  int counter = 0;

  void initState() {
    super.initState();
  }
  dynamic fetchImage() async{
    var client = http.Client();
    return await client.get('https://jsonplaceholder.typicode.com/photos/$counter');
  }
  Future<ImageModel> getNextImage() async{
    var client = http.Client();
    counter++;
    if (counter==5001){
      counter = 1;
    }
    var response = await client.get('https://jsonplaceholder.typicode.com/photos/$counter');

    ImageModel imageModel = ImageModel.fromJson(json.decode(response.body));
    return imageModel;
  }
  Widget build (BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Let's See Images!"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: images,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            ImageModel newImage = await getNextImage();
            setState(() {
              images.add(
                Container(
                  margin: EdgeInsets.only(left:20, right:20, top:15),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left:20, right:20, top:20, bottom:10),
                        child: Image.network(newImage.url),
                      ),
                      Container(
                        margin: EdgeInsets.only(left:20, right:20, top:10, bottom:20),
                        child: Text('${newImage.title}'),
                      )
                    ]
                  ),
                ),
              );
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}