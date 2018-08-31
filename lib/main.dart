import 'package:flutter/material.dart';
import 'package:jxc/about.dart';
import 'package:jxc/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp>{
  String _title = 'Please login';

  Widget _screen;
  Login _login;
  About _about;
  bool _authenticated;

  _MyAppState(){
    _login = new Login(onSubmit: (){onSubmit();});
    _about = new About();
    _screen = _login;
    _authenticated = false;
  }

  void onSubmit(){
    print('Login with: ${_login.username} ${_login.password}');
    if(_login.username == 'user' && _login.password == 'password'){
      _setAuthenticated(true);
    }
  }

  void _goHome(){
    print('home is here');
  }

  void _logout(){
    print('logout');
    _setAuthenticated(false);
  }

  void _setAuthenticated(bool auth){
    setState(() {
      if(auth){
        _screen = _about;
        _title = 'Welcome';
        _authenticated = true;
      }else{
        _screen = _login;
        _title = 'Please Login';
        _authenticated = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.home), onPressed: _goHome,),
            new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: _logout)
          ],
        ),
        body: _screen,
      ),
    );
  }
}
