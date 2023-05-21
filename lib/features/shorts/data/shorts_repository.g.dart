// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shorts_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shortsRepositoryHash() => r'043e854b0a959b62bf58c6a4492677ba6b4910ae';

/// See also [shortsRepository].
@ProviderFor(shortsRepository)
final shortsRepositoryProvider = Provider<ShortsRepository>.internal(
  shortsRepository,
  name: r'shortsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shortsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ShortsRepositoryRef = ProviderRef<ShortsRepository>;
String _$shortsHash() => r'80950e643e381affa50a10f98fed3c0c1160cabb';

/// See also [Shorts].
@ProviderFor(Shorts)
final shortsProvider =
    AutoDisposeAsyncNotifierProvider<Shorts, List<Short>>.internal(
  Shorts.new,
  name: r'shortsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$shortsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Shorts = AutoDisposeAsyncNotifier<List<Short>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
