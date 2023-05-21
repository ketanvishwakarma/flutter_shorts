import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'short.freezed.dart';
part 'short.g.dart';

@freezed
class Short with _$Short {
  factory Short({
    required String id,
    required String createdAt,
    required String mediaUrl,
    required String title,
    required String description,
    required String moreUrl,
    required String creatorId,
    @Default([]) List<String> likes,
  }) = _Short;

  factory Short.fromJson(Map<String, dynamic> json) => _$ShortFromJson(json);
}

List<Short> buildShortListFromResponse(
  String response,
) {
  return (json.decode(response) as List<dynamic>)
      .map(
        (json) => Short.fromJson(json as Map<String, dynamic>),
      )
      .toList();
}
