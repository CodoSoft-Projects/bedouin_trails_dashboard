import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/request_trip_info_section.dart';
import 'widgets/request_users_grid_view.dart';

class RequestDetailsView extends StatefulWidget {
  const RequestDetailsView({super.key});
  static const routeName = 'RequestDetailsView';

  @override
  State<RequestDetailsView> createState() => _RequestDetailsViewState();
}

class _RequestDetailsViewState extends State<RequestDetailsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;
  List<String> tabs = ['بيانات الرحلة', 'حجوزات الرحلة'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      animationDuration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'حجوزات الرحلة',

        bottom: TabBar(
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          padding: const EdgeInsets.symmetric(horizontal: 16),
          dividerColor: Colors.transparent,
          tabAlignment: TabAlignment.center,
          controller: _tabController,
          indicatorColor: Colors.transparent,
          isScrollable: true,
          labelPadding: EdgeInsets.zero,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          tabs: tabs
              .map(
                (e) => Tab(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          tabs.indexOf(e) == currentIndex ? 16 : 0,
                        ),
                        topRight: Radius.circular(
                          tabs.indexOf(e) == currentIndex ? 16 : 0,
                        ),
                        //
                      ),
                      color: currentIndex == tabs.indexOf(e)
                          ? AppColors.sandyBrown
                          : AppColors.whiteGrey,
                    ),
                    child: Text(
                      e,
                      style: AppTextStyles.medium16(context).copyWith(
                        color: currentIndex == tabs.indexOf(e)
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const RequestTripInfoSection(),
          const RequestUsersGridView(),
        ],
      ),
    );
  }
}
