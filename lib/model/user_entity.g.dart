// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_entity;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserEntity> _$userEntitySerializer = new _$UserEntitySerializer();

class _$UserEntitySerializer implements StructuredSerializer<UserEntity> {
  @override
  final Iterable<Type> types = const [UserEntity, _$UserEntity];
  @override
  final String wireName = 'UserEntity';

  @override
  Iterable serialize(Serializers serializers, UserEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'full_name',
      serializers.serialize(object.fullName,
          specifiedType: const FullType(String)),
      'profile_pic',
      serializers.serialize(object.profilePic,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UserEntity deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'full_name':
          result.fullName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'profile_pic':
          result.profilePic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserEntity extends UserEntity {
  @override
  final int id;
  @override
  final String fullName;
  @override
  final String profilePic;

  factory _$UserEntity([void Function(UserEntityBuilder) updates]) =>
      (new UserEntityBuilder()..update(updates)).build();

  _$UserEntity._({this.id, this.fullName, this.profilePic}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('UserEntity', 'id');
    }
    if (fullName == null) {
      throw new BuiltValueNullFieldError('UserEntity', 'fullName');
    }
    if (profilePic == null) {
      throw new BuiltValueNullFieldError('UserEntity', 'profilePic');
    }
  }

  @override
  UserEntity rebuild(void Function(UserEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserEntityBuilder toBuilder() => new UserEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserEntity &&
        id == other.id &&
        fullName == other.fullName &&
        profilePic == other.profilePic;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), fullName.hashCode), profilePic.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserEntity')
          ..add('id', id)
          ..add('fullName', fullName)
          ..add('profilePic', profilePic))
        .toString();
  }
}

class UserEntityBuilder implements Builder<UserEntity, UserEntityBuilder> {
  _$UserEntity _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _fullName;
  String get fullName => _$this._fullName;
  set fullName(String fullName) => _$this._fullName = fullName;

  String _profilePic;
  String get profilePic => _$this._profilePic;
  set profilePic(String profilePic) => _$this._profilePic = profilePic;

  UserEntityBuilder();

  UserEntityBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _fullName = _$v.fullName;
      _profilePic = _$v.profilePic;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserEntity;
  }

  @override
  void update(void Function(UserEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserEntity build() {
    final _$result = _$v ??
        new _$UserEntity._(id: id, fullName: fullName, profilePic: profilePic);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
