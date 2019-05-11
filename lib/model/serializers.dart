library travel_buddy.models.serializers;

import 'package:built_value/serializer.dart';
import 'package:demo_flutter/model/user_entity.dart';
import 'package:built_collection/built_collection.dart';

part 'serializers.g.dart';

@SerializersFor(const [UserEntity])
final Serializers serializers = (_$serializers.toBuilder()).build();
