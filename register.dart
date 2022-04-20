import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
//import package file manually

//void main() => runApp(MyApp());
class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: WriteSQLdata() //set the class here
    );
  }
}

class WriteSQLdata extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return WriteSQLdataState();
  }
}

class WriteSQLdataState extends State<WriteSQLdata>{

  TextEditingController namectl = TextEditingController();
  TextEditingController emailctl = TextEditingController();
  TextEditingController genderctl = TextEditingController();
  TextEditingController passwordctl = TextEditingController();
  //text controller for TextField


  bool error = false;
  bool sending = false;
  bool success = false;
  String msg = "";
  String phpurl = "http://192.168.1.31:8080/indexregister.php";
  String rooturl = "http://192.168.1.31:8080/indexregister.php";
  String usernameField = "?username=";
  String emailField = "email=";
  String passwordField = "password=";
  String genderField = "gender=";


  @override
  void initState() {
    error = false;
    sending = false;
    success = false;
    msg = "";
    super.initState();
  }
  Future<void> send() async{
    String newurl=rooturl+usernameField+namectl.text+"&"+emailField+emailctl.text+"&"+passwordField+passwordctl.text+"&"+genderField+genderctl.text;
    var response=await http.get(Uri.parse(newurl));
    print(response.body);
    print(newurl);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("REGISTER"),
      ), //appbar

      body: SingleChildScrollView( //enable scrolling, when keyboard appears,
        // hight becomes small, so prevent overflow
          child:Container(
              padding: EdgeInsets.all(20),
              child: Column(children: <Widget>[


                Container(
                    child: TextField(
                      controller: namectl,
                      decoration: InputDecoration(
                        labelText:"Name:",
                      ),
                    )
                ), //text input for name

                Container(
                    child: TextField(
                      controller: emailctl,
                      decoration: InputDecoration(
                        labelText:"Email:",
                      ),
                    )
                ), //text input for address

                Container(
                    child: TextField(
                      controller: genderctl,
                      decoration: InputDecoration(
                        labelText:"Gender:",
                      ),
                    )
                ), //text input for class

                Container(
                    child: TextField(
                      controller: passwordctl,
                      decoration: InputDecoration(
                        labelText:"Password:",
                      ),
                    )
                ), //text input for roll no

                Container(
                    margin: EdgeInsets.only(top:20),
                    child:SizedBox(
                        width: double.infinity,
                        child:ElevatedButton(
                          onPressed:(){ //if button is pressed, setstate sending = true, so that we can show "sending..."
                            send();
                          },
                          child: Text(
                            "REGISTER",
                          ),
                          //background of button is darker color, so set brightness to dark
                        )
                    )
                )
              ],)
          )
      ),
    );
  }
}