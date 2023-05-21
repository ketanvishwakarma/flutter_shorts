import 'package:flutter_shorts/features/shorts/model/create_short/create_short.dart';
import 'package:flutter_shorts/features/shorts/model/short/short.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart'
    show PostgrestList, Supabase, SupabaseClient, SupabaseQueryBuilder;

part 'shorts_repository.g.dart';

class ShortsRepository {
  ShortsRepository(this._client);

  final SupabaseClient _client;

  SupabaseQueryBuilder get _shortsTable => _client.from('shorts');

  Future<void> createShort(CreateShort createShort) {
    return _shortsTable.insert(createShort.toJson());
  }

  Future<List<Short>> getShorts() async {
    final data = await _shortsTable.select<PostgrestList>();
    final list = data.map(Short.fromJson).toList();
    return list;
  }
}

@Riverpod(keepAlive: true)
ShortsRepository shortsRepository(ShortsRepositoryRef ref) {
  return ShortsRepository(Supabase.instance.client);
}

@riverpod
FutureOr<List<Short>> shorts(ShortsRef ref) {
  return ref.read(shortsRepositoryProvider).getShorts();
}
