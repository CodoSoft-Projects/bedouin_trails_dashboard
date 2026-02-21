class BookingsStats {
  final int total;
  final int paid;
  final int cancelled;
  final int pending;

  const BookingsStats({
    required this.total,
    required this.paid,
    required this.cancelled,
    required this.pending,
  });

  factory BookingsStats.fromJson(Map<String, dynamic>? json) {
    if (json == null) return BookingsStats.empty();

    return BookingsStats(
      total: json['total'] ?? 0,
      paid: json['paid'] ?? 0,
      cancelled: json['cancelled'] ?? 0,
      pending: json['pending'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'paid': paid,
      'cancelled': cancelled,
      'pending': pending,
    };
  }

  factory BookingsStats.empty() {
    return const BookingsStats(total: 0, paid: 0, cancelled: 0, pending: 0);
  }

  int get accepted => total - cancelled - pending - paid;
}
