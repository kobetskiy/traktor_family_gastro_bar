import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/view/tabs_screens/tab_service.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/widgets/index.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class MealsListScreen extends StatefulWidget {
  const MealsListScreen({super.key});

  @override
  State<MealsListScreen> createState() => _MealsListScreenState();
}

final _tabService = TabService();

class _MealsListScreenState extends State<MealsListScreen> {
  final _textController = TextEditingController();
  final _mealsListBloc = MealsListBloc();

  void switchSearchField() {
    _textController.clear();
    _tabService.switchSearchField();
    setState(() {});
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabService.allTabs.length,
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
                    onPressed: switchSearchField,
                  )
                ],
              ),
            ],
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                _tabService.isSearchShown
                    ? SearchTextFieldWidget(
                        controller: _textController, bloc: _mealsListBloc)
                    : const _TabBarWidget(),
                _tabService.isSearchShown
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
    return TabBar(
      controller: _tabService.tabController,
      isScrollable: true,
      tabs: _tabService.allTabsNames(context),
    );
  }
}

class _TabBarViewWidget extends StatelessWidget {
  const _TabBarViewWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        children: _tabService.allTabs,
      ),
    );
  }
}
