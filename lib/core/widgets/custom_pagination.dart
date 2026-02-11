import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class CustomPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int page) onPageChanged;

  const CustomPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _previousButton(context),
        const SizedBox(width: 8),
        ..._buildPageNumbers(),
        const SizedBox(width: 8),
        _nextButton(context),
      ],
    );
  }

  // ================= PREVIOUS =================
  Widget _previousButton(BuildContext context) {
    return InkWell(
      onTap: currentPage == 1 ? null : () => onPageChanged(currentPage - 1),
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          S.of(context).previous,
          style: TextStyle(
            color: currentPage == 1 ? Colors.grey : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // ================= NEXT =================
  Widget _nextButton(BuildContext context) {
    return InkWell(
      onTap: currentPage == totalPages
          ? null
          : () => onPageChanged(currentPage + 1),
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          S.of(context).next,
          style: TextStyle(
            color: currentPage == totalPages ? Colors.grey : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // ================= PAGE NUMBERS =================
  List<Widget> _buildPageNumbers() {
    List<Widget> pages = [];

    final visiblePages = _calculateVisiblePages();

    for (var page in visiblePages) {
      if (page == -1) {
        pages.add(
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text("..."),
          ),
        );
      } else {
        pages.add(_pageItem(page));
      }
    }

    return pages;
  }

  // ================= PAGE ITEM =================
  Widget _pageItem(int page) {
    final bool isActive = page == currentPage;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: () => onPageChanged(page),
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 36,
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF1E5EFF) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isActive ? const Color(0xFF1E5EFF) : Colors.grey.shade300,
            ),
          ),
          child: Text(
            page.toString(),
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  // ================= LOGIC =================
  List<int> _calculateVisiblePages() {
    List<int> pages = [];

    if (totalPages <= 7) {
      for (int i = 1; i <= totalPages; i++) {
        pages.add(i);
      }
      return pages;
    }

    pages.add(1);

    if (currentPage > 4) {
      pages.add(-1); // ellipsis
    }

    int start = (currentPage - 1).clamp(2, totalPages - 3);
    int end = (currentPage + 1).clamp(4, totalPages - 1);

    for (int i = start; i <= end; i++) {
      pages.add(i);
    }

    if (currentPage < totalPages - 3) {
      pages.add(-1);
    }

    pages.add(totalPages);

    return pages;
  }
}
