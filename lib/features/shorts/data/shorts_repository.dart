import 'package:flutter_shorts/features/shorts/model/create_short/create_short.dart';
import 'package:flutter_shorts/features/shorts/model/short/short.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart'
    show
        PostgrestList,
        Supabase,
        SupabaseClient,
        SupabaseQueryBuilder;

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

  Future<Short> getShortById(String id) async {
    final data = await _shortsTable.select<PostgrestList>().eq('id', id);
    final list = data.map(Short.fromJson).toList();
    return list.first;
  }

  Future<void> updateShort(String id, Map<String, dynamic> data) async {
    await _shortsTable.update(data).eq('id', id);
  }
}

@Riverpod(keepAlive: true)
ShortsRepository shortsRepository(ShortsRepositoryRef ref) {
  return ShortsRepository(Supabase.instance.client);
}

@riverpod
class Shorts extends _$Shorts {
  @override
  FutureOr<List<Short>> build() {
    _loadShorts();
    return [];
  }

  Future<void> _loadShorts() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(shortsRepositoryProvider).getShorts(),
    );
  }

  void updateShort(Short short) {
    state.whenData((shorts) {
      final index = shorts.indexWhere((element) => element.id == short.id);
      shorts[index] = short;
    });
  }
}
