import 'package:json_annotation/json_annotation.dart';

part 'obj_bean.g.dart';

@JsonSerializable()
class ObjBean extends Object{
  ObjBean(this.userName, this.realName);

  String userName;
  String realName;

  factory ObjBean.fromJson(Map<String, dynamic> json) => _$ObjBeanFromJson(json);
  Map<String, dynamic> toJson() => _$ObjBeanToJson(this);
}