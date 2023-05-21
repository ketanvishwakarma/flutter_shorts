import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_short.freezed.dart';
part 'create_short.g.dart';

@freezed
class CreateShort with _$CreateShort {
  factory CreateShort({
    required String mediaUrl,
    required String title,
    required String description,
    required String moreUrl,
    required String creatorId,
  }) = _CreateShort;

  factory CreateShort.fromJson(Map<String, dynamic> json) =>
      _$CreateShortFromJson(json);
}
