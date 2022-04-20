import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class ProfileApp extends StatelessWidget {
  const ProfileApp({Key? key, required this.id, required this.username, required this.email, required this.gender}) : super(key: key);
  final String id, username, email, gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Column(
          children: [
            InfoWidget(element: "ID", content: id),
            InfoWidget(element: "Username", content: username),
            InfoWidget(element: "Email", content: email),
            InfoWidget(element: "Gender", content: gender),
            ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("LOGOUT"))
          ],
        ),
      ) 
      ,
    );
  }
}
class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key, required this.element, required this.content}) : super(key: key);
  final String element;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(element+":", style: TextStyle(fontWeight: FontWeight.bold),),
          Text(content)
        ],
      ),
    );
  }
}

