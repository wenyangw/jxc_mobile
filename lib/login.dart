import 'package:flutter/material.dart';

class Login extends StatelessWidget{
  const Login({
    Key key,
    @required this.onSubmit,
  }): super(key: key);

  final VoidCallback onSubmit;

  static final TextEditingController _user = new TextEditingController();
  static final TextEditingController _pass = new TextEditingController();

  String get username => _user.text;
  String get password => _pass.text;

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                child: new Image.asset(
                  'images/icon_username.png',
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.fill,
                ),
              ),
              new Expanded(
                child: new TextField(
                  controller: _user,
                  decoration: new InputDecoration(
                    hintText: 'Enter a username',
                    suffixIcon: new IconButton(
                      icon: new Icon(Icons.clear, color: Colors.black45,),
                      onPressed: (){
                        _user.clear();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        new Padding(
          padding: new EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 40.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                child: new Image.asset(
                  'images/icon_password.png',
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.fill,
                ),
              ),
              new Expanded(
                child: new TextField(
                  controller: _pass,
                  decoration: new InputDecoration(
                    hintText: 'Enter a password',
                    suffixIcon: new IconButton(
                      icon: new Icon(Icons.clear, color: Colors.black45,),
                      onPressed: (){
                        _pass.clear();
                      },
                    ),
                  ),
                  obscureText: true,
                ),
              ),
            ]
          ),
        ),
        new Container(
          width: 340.0,
          child: new Card(
            color: Colors.blue,
            elevation: 16.0,
            child: new FlatButton(
              onPressed: onSubmit,
              child: new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new Text(
                  'Submit',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}