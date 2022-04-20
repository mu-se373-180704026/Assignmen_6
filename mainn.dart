import 'package:flutter/material.dart';
import 'register.dart';
import 'login.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage()
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Client-Server Assignment'),
        ),
        body: Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
          Container(
            margin: EdgeInsets.all(25),
            child: ElevatedButton(
              child: const Text('Register'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WriteSQLdata() ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(25),
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginApp() ),
                );
              },
            ),
          ),
        ]
        ))
    );
  }
}
