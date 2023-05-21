// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_short.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateShort _$CreateShortFromJson(Map<String, dynamic> json) {
  return _CreateShort.fromJson(json);
}

/// @nodoc
mixin _$CreateShort {
  String get mediaUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get moreUrl => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateShortCopyWith<CreateShort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateShortCopyWith<$Res> {
  factory $CreateShortCopyWith(
          CreateShort value, $Res Function(CreateShort) then) =
      _$CreateShortCopyWithImpl<$Res, CreateShort>;
  @useResult
  $Res call(
      {String mediaUrl,
      String title,
      String description,
      String moreUrl,
      String creatorId});
}

/// @nodoc
class _$CreateShortCopyWithImpl<$Res, $Val extends CreateShort>
    implements $CreateShortCopyWith<$Res> {
  _$CreateShortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaUrl = null,
    Object? title = null,
    Object? description = null,
    Object? moreUrl = null,
    Object? creatorId = null,
  }) {
    return _then(_value.copyWith(
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      moreUrl: null == moreUrl
          ? _value.moreUrl
          : moreUrl // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateShortCopyWith<$Res>
    implements $CreateShortCopyWith<$Res> {
  factory _$$_CreateShortCopyWith(
          _$_CreateShort value, $Res Function(_$_CreateShort) then) =
      __$$_CreateShortCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mediaUrl,
      String title,
      String description,
      String moreUrl,
      String creatorId});
}

/// @nodoc
class __$$_CreateShortCopyWithImpl<$Res>
    extends _$CreateShortCopyWithImpl<$Res, _$_CreateShort>
    implements _$$_CreateShortCopyWith<$Res> {
  __$$_CreateShortCopyWithImpl(
      _$_CreateShort _value, $Res Function(_$_CreateShort) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaUrl = null,
    Object? title = null,
    Object? description = null,
    Object? moreUrl = null,
    Object? creatorId = null,
  }) {
    return _then(_$_CreateShort(
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      moreUrl: null == moreUrl
          ? _value.moreUrl
          : moreUrl // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateShort implements _CreateShort {
  _$_CreateShort(
      {required this.mediaUrl,
      required this.title,
      required this.description,
      required this.moreUrl,
      required this.creatorId});

  factory _$_CreateShort.fromJson(Map<String, dynamic> json) =>
      _$$_CreateShortFromJson(json);

  @override
  final String mediaUrl;
  @override
  final String title;
  @override
  final String description;
  @override
  final String moreUrl;
  @override
  final String creatorId;

  @override
  String toString() {
    return 'CreateShort(mediaUrl: $mediaUrl, title: $title, description: $description, moreUrl: $moreUrl, creatorId: $creatorId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateShort &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.moreUrl, moreUrl) || other.moreUrl == moreUrl) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, mediaUrl, title, description, moreUrl, creatorId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateShortCopyWith<_$_CreateShort> get copyWith =>
      __$$_CreateShortCopyWithImpl<_$_CreateShort>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateShortToJson(
      this,
    );
  }
}

abstract class _CreateShort implements CreateShort {
  factory _CreateShort(
      {required final String mediaUrl,
      required final String title,
      required final String description,
      required final String moreUrl,
      required final String creatorId}) = _$_CreateShort;

  factory _CreateShort.fromJson(Map<String, dynamic> json) =
      _$_CreateShort.fromJson;

  @override
  String get mediaUrl;
  @override
  String get title;
  @override
  String get description;
  @override
  String get moreUrl;
  @override
  String get creatorId;
  @override
  @JsonKey(ignore: true)
  _$$_CreateShortCopyWith<_$_CreateShort> get copyWith =>
      throw _privateConstructorUsedError;
}
