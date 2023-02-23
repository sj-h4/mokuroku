// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      id: json['id'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
      publishedYear: json['publishedYear'] as String,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      summary: json['summary'] as String?,
      isbn: json['isbn'] as String?,
      bibtex: json['bibtex'] as String?,
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'publishedYear': instance.publishedYear,
      'tags': instance.tags,
      'summary': instance.summary,
      'isbn': instance.isbn,
      'bibtex': instance.bibtex,
    };
