import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/features/home/widgets/bottom_sheet_buttons/index.dart';
import 'package:traktor_family_gastro_bar/features/home/widgets/index.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/services/tab_service.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabService _tabService;

  @override
  void initState() {
    super.initState();
    _tabService = Provider.of<TabService>(context, listen: false);
    _tabService.init(this);
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
                const TopBanners(),
                const HomeCategoriesListView(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(S.of(context).popular,
                      style: Theme.of(context).textTheme.titleSmall),
                ),
                const SizedBox(height: 10),
                const HomeMealsPresentation(
                  filterField: DatabaseMealFields.likesCount,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    S.of(context).novelty,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                const SizedBox(height: 10),
                const HomeMealsPresentation(
                  filterField: DatabaseMealFields.date,
                ),
                const SizedBox(height: 20),
                Center(
                  child: PrimaryButton.outlined(
                    width: 315,
                    child: const ContactUsButtonContent(),
                    onPressed: () => _showContactUsSheet(context),
                  ),
                ),
                const WatermarkWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<T?> _showContactUsSheet<T>(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 500,
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              width: 60,
              height: 3,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Text(
                S.of(context).contactUs,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 18),
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
