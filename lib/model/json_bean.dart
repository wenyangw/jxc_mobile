import 'package:json_annotation/json_annotation.dart';
import 'package:jxc/model/obj_bean.dart';

part 'json_bean.g.dart';

@JsonSerializable()
class JsonBean extends Object{
  String msg;
  bool success;
  ObjBean obj;

  JsonBean(this.msg, this.success, this.obj);

  factory JsonBean.fromJson(Map<String, dynamic> json) => _$JsonBeanFromJson(json);
  Map<String, dynamic> toJson() => _$JsonBeanToJson(this);
}