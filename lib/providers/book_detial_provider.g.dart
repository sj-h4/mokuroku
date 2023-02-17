// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_detial_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$bookDetialHash() => r'5a6104780c7e1cdaf1e00e1dba444606fc2ab656';

/// See also [bookDetial].
class BookDetialProvider extends AutoDisposeFutureProvider<Book?> {
  BookDetialProvider(
    this.bookId,
  ) : super(
          (ref) => bookDetial(
            ref,
            bookId,
          ),
          from: bookDetialProvider,
          name: r'bookDetialProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bookDetialHash,
        );

  final int bookId;

  @override
  bool operator ==(Object other) {
    return other is BookDetialProvider && other.bookId == bookId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bookId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef BookDetialRef = AutoDisposeFutureProviderRef<Book?>;

/// See also [bookDetial].
final bookDetialProvider = BookDetialFamily();

class BookDetialFamily extends Family<AsyncValue<Book?>> {
  BookDetialFamily();

  BookDetialProvider call(
    int bookId,
  ) {
    return BookDetialProvider(
      bookId,
    );
  }

  @override
  AutoDisposeFutureProvider<Book?> getProviderOverride(
    covariant BookDetialProvider provider,
  ) {
    return call(
      provider.bookId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'bookDetialProvider';
}
