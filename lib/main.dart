
import 'package:commerceapp/add_product_page.dart';
import 'package:commerceapp/database/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  Future<void> Signin() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword
        (email: _email.text, password: _password.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sign In using Firebase'),
        centerTitle: true,
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text('Subscribe'),
            new TextField(
              decoration: new InputDecoration(
                  labelText: 'email',
                  hintText: 'Email',
                  icon: new Icon(Icons.people)),
              keyboardType: TextInputType.text,
              controller: _email,
            ),
            SizedBox(
              height: 10,
            ),
            new TextField(
              decoration: new InputDecoration(
                  labelText: 'password',
                  hintText: 'password',
                  suffixIcon: const Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: const Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                      )
                  ),

                  prefixIcon: new Icon(Icons.people)),
              obscureText: true,
              keyboardType: TextInputType.text,
              controller: _password,
            ),
            new ElevatedButton(onPressed: Signin, child: Text("SignIn")),
            new ElevatedButton(onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()))
            }
            , child: Text("SignUp")),

          ],
        ),
      ),
    );

  }
}
