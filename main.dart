
import 'package:flutter/material.dart';
import './app.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main()
{
  runApp(App());
}
// void main() async
// {
//   var response = await fetchAlbum();
// }
// void main() async
// {
//   var response = await http.get('https://jsonplaceholder.typicode.com/photos/1');
//   print(response.body);
//   print(json.decode(response.body));
// }
// Future<Album> fetchAlbum() async {
//   var response = await http.get('https://jsonplaceholder.typicode.com/photos/1');

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     print(response.body);
//     print(json.decode(response.body));
//     return Album.fromJson(json.decode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
// class Album {
//   final int userId;
//   final int id;
//   final String title;

//   Album({this.userId, this.id, this.title});

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }