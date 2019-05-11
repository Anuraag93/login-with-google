library user_entity;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:demo_flutter/model/serializers.dart';

part 'user_entity.g.dart';

abstract class UserEntity implements Built<UserEntity, UserEntityBuilder> {
  UserEntity._();

  factory UserEntity([updates(UserEntityBuilder b)]) = _$UserEntity;

  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'full_name')
  String get fullName;
  @BuiltValueField(wireName: 'profile_pic')
  String get profilePic;
  String toJson() {
    return json.encode(serializers.serializeWith(UserEntity.serializer, this));
  }

  static UserEntity fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserEntity.serializer, json.decode(jsonString));
  }

  static UserEntity fromDocument(Map<String, dynamic> data, String documentId) {
    if (data == null) return null;
    var map = new Map.from(data)..addEntries([new MapEntry("id", documentId)]);
    final user = serializers.deserializeWith(UserEntity.serializer, map);
    return user;
  }

  Map<String, dynamic> toDocument() {
    return serializers.serializeWith(UserEntity.serializer, this) as Map;
  }

  static Serializer<UserEntity> get serializer => _$userEntitySerializer;
}
