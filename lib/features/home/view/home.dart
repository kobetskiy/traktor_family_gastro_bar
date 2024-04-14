import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors.dart';
import 'package:traktor_family_gastro_bar/features/home/view/bottom_sheet_buttons/index.dart';
import 'package:traktor_family_gastro_bar/features/home/widgets/index.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/view/tabs_screens/tab_service.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? bannerController;
  final tabService = TabService();

  @override
  void initState() {
    bannerController = TabController(length: 3, vsync: this);
    tabService.tabController = TabController(
      length: tabService.allTabs.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const AppBarWidget(title: 'Traktor Family Gastro Bar'),
          ],
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBanners(bannerController: bannerController),
                const SizedBox(height: 5),
                Center(child: TabPageSelector(controller: bannerController)),
                const SizedBox(height: 20),
                const HomeCategoriesListView(),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Популярні'),
                ),
                const SizedBox(height: 10),
                const HomePopularMealsListView(),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Новинки'),
                ),
                const SizedBox(height: 10),
                const HomePopularMealsListView(),
                const SizedBox(height: 20),
                Center(
                  child: PrimaryButton.outlined(
                    width: 315,
                    child: const ContactUsButtonContent(),
                    onPressed: () => showContactUsSheet(context),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<T?> showContactUsSheet<T>(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              width: 60,
              height: 3,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.subtitleColor,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Text(
                S.of(context).contactUs,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const InstagramButtonLink(),
            const SizedBox(height: 15),
            const FacebookButtonLink(),
            const SizedBox(height: 15),
            const EmailButtonLink(),
            const SizedBox(height: 15),
            const PhoneButtonLink(),
          ],
        ),
      ),
    );
  }
}
