import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/images_constants.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

final mealsListBloc = MealsListBloc();

class ServerErrorWidget extends StatelessWidget {
  const ServerErrorWidget({super.key, this.collection});

  final String? collection;

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
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        Text(
          S.of(context).pleaseTryAgainLater,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.grey[600]),
        ),
        collection != null
            ? const SizedBox(height: 40)
            : const SizedBox.shrink(),
        collection != null
            ? TextButton(
                child: Text(
                  S.of(context).tryAgain,
                  style: const TextStyle(fontSize: 16),
                ),
                onPressed: () => mealsListBloc
                    .add(LoadAllMealsList(collection: collection!)),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
