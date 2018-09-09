import 'package:json_annotation/json_annotation.dart';
import 'package:jxc/model/obj_bean.dart';

part 'json_bean.g.dart';

@JsonSerializable()
class JsonBean extends Object with _$JsonBeanSerializerMixin{
  JsonBean(this.msg, this.success, this.obj);

  String msg;
  bool success;
  ObjBean obj;

  factory JsonBean.fromJson(Map<String, dynamic> json) => _$JsonBeanFromJson(json);
}