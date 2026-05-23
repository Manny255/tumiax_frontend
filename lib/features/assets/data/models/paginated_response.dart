// lib/features/assets/data/models/paginated_response.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_response.freezed.dart';

@freezed
sealed class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse({
    required String status,
    required int count,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'current_page') required int currentPage,
    String? next,
    String? previous,
    required List<T> results,
    @JsonKey(name: 'page_size') required int pageSize,
  }) = _PaginatedResponse<T>;

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PaginatedResponse<T>(
      status: json['status'] as String,
      count: json['count'] as int,
      totalPages: json['total_pages'] as int,
      currentPage: json['current_page'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List)
          .map((e) => fromJsonT(e as Map<String, dynamic>))
          .toList(),
      pageSize: json['page_size'] as int,
    );
  }
}
