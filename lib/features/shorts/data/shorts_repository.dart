import 'package:flutter_shorts/features/shorts/model/create_short/create_short.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart'
    show Supabase, SupabaseClient;

part 'shorts_repository.g.dart';

class ShortsRepository {
  ShortsRepository(this._client);

  final SupabaseClient _client;

  Future<void> createShort(CreateShort createShort) {
    return _client.from('shorts').insert(createShort.toJson());
  }
}

@Riverpod(keepAlive: true)
ShortsRepository shortsRepository(ShortsRepositoryRef ref) {
  return ShortsRepository(Supabase.instance.client);
}
