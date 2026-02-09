import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/user_info_list_tile.dart';

class UserDetailsView extends StatefulWidget {
  const UserDetailsView({super.key});
  static const routeName = '/user-details-view';

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;
  List<String> tabs = [
    'حجوزات معلقة',
    'حجوزات مدفوعة',
    'حجوزات مكتملة',
    'حجوزات ملغاة',
  ];
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
        titleWidgt: const UserInfoListTile(),

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
          const Center(child: Text('حجوزات معلقة')),
          const Center(child: Text('حجوزات مدفوعة')),
          const Center(child: Text('حجوزات مكتملة')),
          const Center(child: Text('حجوزات ملغاة')),
        ],
      ),
    );
  }
}
