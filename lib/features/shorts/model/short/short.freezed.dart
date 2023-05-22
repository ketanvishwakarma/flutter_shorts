// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'short.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Short _$ShortFromJson(Map<String, dynamic> json) {
  return _Short.fromJson(json);
}

/// @nodoc
mixin _$Short {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get mediaUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get moreUrl => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  bool get isPublished => throw _privateConstructorUsedError;
  List<String> get likes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShortCopyWith<Short> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortCopyWith<$Res> {
  factory $ShortCopyWith(Short value, $Res Function(Short) then) =
      _$ShortCopyWithImpl<$Res, Short>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String mediaUrl,
      String title,
      String description,
      String moreUrl,
      String creatorId,
      bool isPublished,
      List<String> likes});
}

/// @nodoc
class _$ShortCopyWithImpl<$Res, $Val extends Short>
    implements $ShortCopyWith<$Res> {
  _$ShortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? mediaUrl = null,
    Object? title = null,
    Object? description = null,
    Object? moreUrl = null,
    Object? creatorId = null,
    Object? isPublished = null,
    Object? likes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
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
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShortCopyWith<$Res> implements $ShortCopyWith<$Res> {
  factory _$$_ShortCopyWith(_$_Short value, $Res Function(_$_Short) then) =
      __$$_ShortCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String mediaUrl,
      String title,
      String description,
      String moreUrl,
      String creatorId,
      bool isPublished,
      List<String> likes});
}

/// @nodoc
class __$$_ShortCopyWithImpl<$Res> extends _$ShortCopyWithImpl<$Res, _$_Short>
    implements _$$_ShortCopyWith<$Res> {
  __$$_ShortCopyWithImpl(_$_Short _value, $Res Function(_$_Short) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? mediaUrl = null,
    Object? title = null,
    Object? description = null,
    Object? moreUrl = null,
    Object? creatorId = null,
    Object? isPublished = null,
    Object? likes = null,
  }) {
    return _then(_$_Short(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
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
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Short implements _Short {
  _$_Short(
      {required this.id,
      required this.createdAt,
      required this.mediaUrl,
      required this.title,
      required this.description,
      required this.moreUrl,
      required this.creatorId,
      this.isPublished = false,
      final List<String> likes = const []})
      : _likes = likes;

  factory _$_Short.fromJson(Map<String, dynamic> json) =>
      _$$_ShortFromJson(json);

  @override
  final String id;
  @override
  final String createdAt;
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
  @JsonKey()
  final bool isPublished;
  final List<String> _likes;
  @override
  @JsonKey()
  List<String> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  @override
  String toString() {
    return 'Short(id: $id, createdAt: $createdAt, mediaUrl: $mediaUrl, title: $title, description: $description, moreUrl: $moreUrl, creatorId: $creatorId, isPublished: $isPublished, likes: $likes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Short &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.moreUrl, moreUrl) || other.moreUrl == moreUrl) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            const DeepCollectionEquality().equals(other._likes, _likes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      mediaUrl,
      title,
      description,
      moreUrl,
      creatorId,
      isPublished,
      const DeepCollectionEquality().hash(_likes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShortCopyWith<_$_Short> get copyWith =>
      __$$_ShortCopyWithImpl<_$_Short>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShortToJson(
      this,
    );
  }
}

abstract class _Short implements Short {
  factory _Short(
      {required final String id,
      required final String createdAt,
      required final String mediaUrl,
      required final String title,
      required final String description,
      required final String moreUrl,
      required final String creatorId,
      final bool isPublished,
      final List<String> likes}) = _$_Short;

  factory _Short.fromJson(Map<String, dynamic> json) = _$_Short.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
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
  bool get isPublished;
  @override
  List<String> get likes;
  @override
  @JsonKey(ignore: true)
  _$$_ShortCopyWith<_$_Short> get copyWith =>
      throw _privateConstructorUsedError;
}
