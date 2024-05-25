import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/widgets/categories_meals_shimmer_loading.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/widgets/index.dart';

class BarbecueMenuTab extends StatefulWidget {
  const BarbecueMenuTab({super.key});

  @override
  State<BarbecueMenuTab> createState() => _BarbecueMenuTabState();
}

class _BarbecueMenuTabState extends State<BarbecueMenuTab> {
  final _bloc = MealsListBloc();

  @override
  void initState() {
    super.initState();
    _bloc
        .add(LoadAllMealsList(collection: DatabaseMealCategories.barbecueMenu));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsListBloc, MealsListState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is MealsListSuccess) {
          return MealsListViewWidget(state: state);
        }
        if (state is MealsListFailure) {
          return const ServerErrorWidget(
            collection: DatabaseMealCategories.barbecueMenu,
          );
        }
        return const CategoriesMealsShimmerLoading();
      },
    );
  }
}
