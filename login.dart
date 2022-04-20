import 'dart:convert';
import 'profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
//import package file manually

//void main() => runApp(MyApp());
class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: LoginApp() //set the class here
    );
  }
}

class LoginApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginAppState();
  }
}

class LoginAppState extends State<LoginApp>{

  TextEditingController namectl = TextEditingController();
  TextEditingController emailctl = TextEditingController();
  TextEditingController genderctl = TextEditingController();
  TextEditingController passwordctl = TextEditingController();
  //text controller for TextField

  bool isLogin = false;
  bool error = false;
  bool sending = false;
  bool success = false;
  String msg = "";
  String phpurl = "http://192.168.1.31:8080/indexregister.php";
  String rooturl = "http://192.168.1.31:8080/indexlogin.php";
  String usernameField = "?username=";
  String emailField = "email=";
  String passwordField = "password=";
  String genderField = "gender=";
  var usernameData, idData, emailData, genderData = "";

  @override
  void initState() {
    error = false;
    sending = false;
    success = false;
    msg = "";
    super.initState();
  }
  Future<void> send() async{
    String newurl=rooturl+usernameField+namectl.text+"&"+passwordField+passwordctl.text;
    var response=await http.get(Uri.parse(newurl));
    print(response.body);
    var res = jsonDecode(response.body);
    if(res["message"] == "Login successfull" && !isLogin){
      setState(() {
        isLogin = true;
      });
       usernameData = res["user"]["username"];
       emailData = res["user"]["email"];
       idData = res["user"]["id"];
       genderData = res["user"]["gender"];
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileApp(id: idData.toString(), username: usernameData, email: emailData, gender: genderData) ),
      );
      print("suc");
    }
    print(newurl);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("LOGIN"),
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
                            if(isLogin) {
                              setState(() {
                                isLogin = false;
                              });
                            }
                          },
                          child: Text(
                            "LOGIN",
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