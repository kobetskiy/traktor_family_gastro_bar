import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/widgets/app_bar_widget.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

import 'favorite_meal_card/favorite_meal_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarWidget(
              title: S.of(context).favorites,
            ),
          ],
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return const MealCard();
                  },
                  separatorBuilder: (_, __) => const Divider(height: 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
