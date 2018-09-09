import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:io';

import 'package:jxc/model/json_bean.dart';

class TestListView extends StatelessWidget{

  Dio dio;
  void _getData() async{
    dio = new Dio();
    Response response = await dio.get('http://192.168.0.8/lnyswz/admin/loginMAction!login.action', data:{"userName":"wangwy","password":"802169"});
    //var userMap = json.decode(userText);
    //User user = User.fromJson(userMap);
    var jb = new JsonBean.fromJson(json.decode(response.data));
    print(jb.obj.userName);
  }

  List<String> strItems = <String>[
    '图标 -> keybord', '图标 -> print',
    '图标 -> router', '图标 -> pages',
    '图标 -> xoom_out_map', '图标 -> zoom_out',
    '图标 -> youtube_searched_for', '图标 -> wifi_tethering',
    '图标 -> wifi_lock', '图标 -> widgets',
    '图标 -> weekend', '图标 -> web',
    '图标 -> accessible', '图标 -> ac_unit',
  ];
  
  List<Icon> iconItems = <Icon>[
    new Icon(Icons.keyboard), new Icon(Icons.print),
    new Icon(Icons.router), new Icon(Icons.pages),
    new Icon(Icons.zoom_out_map), new Icon(Icons.zoom_out),
    new Icon(Icons.youtube_searched_for), new Icon(Icons.wifi_tethering),
    new Icon(Icons.wifi_lock), new Icon(Icons.widgets),
    new Icon(Icons.weekend), new Icon(Icons.web),
    new Icon(Icons.accessible), new Icon(Icons.ac_unit),
  ];
  
  Widget buildListData(BuildContext context, String strItem, Icon iconItem){
    return new ListTile(
      isThreeLine: false,
      leading: iconItem,
      title: new Text(strItem),
      trailing: new Icon(Icons.keyboard_arrow_right),
      onTap: (){
        showDialog(
          context: context,
          builder: (BuildContext context){
            return new AlertDialog(
              title: new Text(
                'ListViewDemo',
                style: new TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0
                ),
              ),
              content: new Text('您选择的item内容为：$strItem'),
            );
          }
        );
      },
    );
  }
  
  
  List<Widget> _list = new List();

  @override
  Widget build(BuildContext context) {
    _getData();
    for(int i = 0; i < strItems.length; i++){
      _list.add(buildListData(context, strItems[i], iconItems[i]));
    }

    var divideList = ListTile.divideTiles(context: context, tiles: _list).toList();

    return new Scaffold(
      body: new Scrollbar(
        child: new ListView(
          children: divideList,
        ),
//        child: new ListView.builder(
//          itemCount: iconItems.length,
//          itemBuilder: (context, item){
//            return new Container(
//              child: new Column(
//                children: divideList
//              ),
//            );
//          },
//        ),
      ),
    );
  }

}

