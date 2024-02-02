import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors.dart';
import 'package:traktor_family_gastro_bar/core/ui/images.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/data/models/meal_model.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/view/tabs_screens/meal_card/meal_card.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class EuropeanCuisineTab extends StatefulWidget {
  const EuropeanCuisineTab({super.key});

  @override
  State<EuropeanCuisineTab> createState() => _EuropeanCuisineTabState();
}

class _EuropeanCuisineTabState extends State<EuropeanCuisineTab> {
  final _mealsListBloc = MealsListBloc();

  @override
  void initState() {
    super.initState();
    _mealsListBloc.add(LoadMealsList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsListBloc, MealsListState>(
      bloc: _mealsListBloc,
      builder: (context, state) {
        if (state is MealsListSuccess) {
          return ListView.separated(
            itemCount: state.data.size,
            itemBuilder: (BuildContext context, int index) => MealCard(
              mealModel: MealModel(
                title: state.data.docs[index]['title'],
                cost: state.data.docs[index]['cost'],
                likesCount: state.data.docs[index]['likesCount'],
                grams: state.data.docs[index]['grams'],
                subtitle: state.data.docs[index]['subtitle'],
                imageURL: state.data.docs[index]['imageURL'],
              ),
            ),
            separatorBuilder: (context, index) => const Divider(
              height: 0,
              indent: 0,
              thickness: 1,
            ),
          );
        }
        if (state is MealsListFailure) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: Image.asset(AppImages.loadingFailure),
              ),
              Text(
                S.of(context).serverError,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Text(
                S.of(context).pleaseTryAgainLater,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.subtitleColor),
              ),
              const SizedBox(height: 40),
              TextButton(
                child: Text(
                  S.of(context).tryAgain,
                  style: const TextStyle(fontSize: 16),
                ),
                onPressed: () => _mealsListBloc.add(LoadMealsList()),
              )
            ],
          );
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
