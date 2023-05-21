import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shorts/features/auth/data/auth_repository.dart';
import 'package:flutter_shorts/features/shorts/data/shorts_repository.dart';
import 'package:flutter_shorts/features/shorts/model/short/short.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart'
    show
        User;

part 'shorts_service.g.dart';

class ShortsService {
  ShortsService(this.ref);

  final Ref ref;

  ShortsRepository get shortsRepository => ref.read(shortsRepositoryProvider);
  User? get user => ref.read(appUserProvider);

  Future<Short> like(String shortId) async {
    final short = await shortsRepository.getShortById(shortId);
    final likeList = short.likes.toList()..add(user!.id);
    await shortsRepository.updateShort(shortId, {
      'likes': likeList,
    });
    return short.copyWith(likes: likeList);
  }

  Future<Short> removeLike(String shortId) async {
    final short = await shortsRepository.getShortById(shortId);
    final likeList = short.likes.toList()..remove(user!.id);
    await shortsRepository.updateShort(shortId, {
      'likes': likeList,
    });
    return short.copyWith(likes: likeList);
  }
}

@Riverpod(keepAlive: true)
ShortsService shortService(ShortServiceRef ref) {
  return ShortsService(ref);
}
