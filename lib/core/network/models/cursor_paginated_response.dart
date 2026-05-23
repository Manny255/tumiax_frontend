import 'package:freezed_annotation/freezed_annotation.dart';

part 'cursor_paginated_response.freezed.dart';

@freezed
sealed class CursorPaginatedResponse<T> with _$CursorPaginatedResponse<T> {
  const factory CursorPaginatedResponse({
    required String status,

    @JsonKey(name: 'next_cursor') String? nextCursor,

    @JsonKey(name: 'previous_cursor') String? previousCursor,

    required List<T> results,

    @JsonKey(name: 'page_size') required int pageSize,
  }) = _CursorPaginatedResponse<T>;

  factory CursorPaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return CursorPaginatedResponse<T>(
      status: json['status'] as String,
      nextCursor: json['next_cursor'] as String?,
      previousCursor: json['previous_cursor'] as String?,
      results: (json['results'] as List)
          .map((e) => fromJsonT(e as Map<String, dynamic>))
          .toList(),
      pageSize: json['page_size'] as int,
    );
  }
}
