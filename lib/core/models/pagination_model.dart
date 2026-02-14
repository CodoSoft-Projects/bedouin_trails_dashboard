class PaginationModel {
  final int currentPage;
  final int perPage;
  final int total;
  final int lastPage;

  const PaginationModel({
    required this.currentPage,
    required this.perPage,
    required this.total,
    required this.lastPage,
  });

  /// ---------- Helpers ----------
  bool get hasNextPage => currentPage < lastPage;
  bool get isFirstPage => currentPage == 1;
  bool get isLastPage => currentPage >= lastPage;

  /// ---------- Factory ----------
  factory PaginationModel.fromJson(Map<String, dynamic>? json) {
    int toInt(dynamic value, {int defaultValue = 0}) {
      if (value == null) return defaultValue;
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? defaultValue;
      return defaultValue;
    }

    return PaginationModel(
      currentPage: toInt(json?['current_page'], defaultValue: 1),
      perPage: toInt(json?['per_page'], defaultValue: 10),
      total: toInt(json?['total']),
      lastPage: toInt(json?['last_page'], defaultValue: 1),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "current_page": currentPage,
      "per_page": perPage,
      "total": total,
      "last_page": lastPage,
    };
  }

  // Empty constructor
  PaginationModel.empty()
    : this(currentPage: 1, perPage: 10, total: 0, lastPage: 1);
}
