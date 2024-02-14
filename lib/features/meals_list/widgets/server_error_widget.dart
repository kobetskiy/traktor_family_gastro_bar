import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors.dart';
import 'package:traktor_family_gastro_bar/core/ui/images.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class ServerErrorWidget extends StatelessWidget {
  const ServerErrorWidget({
    super.key,
    required MealsListBloc mealsListBloc,
  }) : _mealsListBloc = mealsListBloc;

  final MealsListBloc _mealsListBloc;

  @override
  Widget build(BuildContext context) {
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
}
