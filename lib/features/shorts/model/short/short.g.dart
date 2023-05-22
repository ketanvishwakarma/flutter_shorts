// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Short _$$_ShortFromJson(Map<String, dynamic> json) => _$_Short(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      mediaUrl: json['mediaUrl'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      moreUrl: json['moreUrl'] as String,
      creatorId: json['creatorId'] as String,
      isPublished: json['isPublished'] as bool? ?? false,
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$_ShortToJson(_$_Short instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'mediaUrl': instance.mediaUrl,
      'title': instance.title,
      'description': instance.description,
      'moreUrl': instance.moreUrl,
      'creatorId': instance.creatorId,
      'isPublished': instance.isPublished,
      'likes': instance.likes,
    };
