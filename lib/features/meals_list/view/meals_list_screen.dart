import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/services/tab_service.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/widgets/index.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class MealsListScreen extends StatefulWidget {
  const MealsListScreen({super.key});

  @override
  State<MealsListScreen> createState() => _MealsListScreenState();
}

class _MealsListScreenState extends State<MealsListScreen>
    with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _mealsListBloc = MealsListBloc();

  void switchSearchField(TabService tabService) {
    _textController.clear();
    tabService.switchSearchField();
    setState(() {});
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabService = Provider.of<TabService>(context, listen: false);

    return DefaultTabController(
      length: tabService.allTabs.length,
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              AppBarWidget(
                title: S.of(context).categories,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => switchSearchField(tabService),
                  )
                ],
              ),
            ],
            body: Column(
              children: [
                tabService.isSearchShown
                    ? SearchTextFieldWidget(
                        controller: _textController, bloc: _mealsListBloc)
                    : const _TabBarWidget(),
                tabService.isSearchShown
                    ? SearchedMealsListWidget(
                        controller: _textController, bloc: _mealsListBloc)
                    : const _TabBarViewWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabBarWidget extends StatefulWidget {
  const _TabBarWidget();

  @override
  State<_TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<_TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tabService = Provider.of<TabService>(context, listen: false);
    return TabBar(
      labelStyle: theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.secondary,
      ),
      indicatorColor: theme.colorScheme.secondary,
      unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
      tabAlignment: TabAlignment.start,
      controller: tabService.controller,
      isScrollable: true,
      tabs: tabService.allTabsNames(context),
    );
  }
}

class _TabBarViewWidget extends StatelessWidget {
  const _TabBarViewWidget();

  @override
  Widget build(BuildContext context) {
    final tabService = Provider.of<TabService>(context, listen: false);
    return Expanded(
      child: TabBarView(
        controller: tabService.controller,
        physics: const NeverScrollableScrollPhysics(),
        children: tabService.allTabs,
      ),
    );
  }
}
