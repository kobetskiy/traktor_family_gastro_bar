import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/features/data/models/meal_model.dart';
import 'package:traktor_family_gastro_bar/features/home/bloc/filtered_meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/widgets/server_error_widget.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class HomeMealsPresentation extends StatefulWidget {
  const HomeMealsPresentation({super.key, required this.filterField});

  final String filterField;

  @override
  State<HomeMealsPresentation> createState() => _HomeMealsPresentationState();
}

class _HomeMealsPresentationState extends State<HomeMealsPresentation> {
  final _bloc = FilteredMealsListBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(LoadFilteredMealsList(filterField: widget.filterField));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredMealsListBloc, FilteredMealsListState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is FilteredMealsListSuccess) {
          return HomeMealsListView(state: state);
        }
        if (state is FilteredMealsListFailure) {
          return const ServerErrorWidget();
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}

class HomeMealsListView extends StatelessWidget {
  const HomeMealsListView({super.key, required this.state});

  final FilteredMealsListSuccess state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 7,
        itemBuilder: (_, int index) {
          return HomeMealsCard(
            mealModel: MealModel(
              title: state.data[index][DatabaseMealFields.title],
              subtitle: state.data[index][DatabaseMealFields.subtitle],
              imageURL: state.data[index][DatabaseMealFields.imageURL],
              cost: state.data[index][DatabaseMealFields.cost],
              likesCount: state.data[index][DatabaseMealFields.likesCount],
              grams: state.data[index][DatabaseMealFields.grams],
              category: state.data[index][DatabaseMealFields.category],
              date: state.data[index][DatabaseMealFields.date],
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 20),
      ),
    );
  }
}

class HomeMealsCard extends StatelessWidget {
  const HomeMealsCard({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: 165,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white12,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.network(
                  mealModel.imageURL,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  mealModel.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.subtitleColor)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(Icons.favorite_border_rounded),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Center(
                                child: Text(mealModel.likesCount.toString()),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Text(
                      '${mealModel.cost} ${S.current.uah}',
                      style: TextStyle(color: AppColors.primaryColor),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
