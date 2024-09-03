import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/images_constants.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarWidget(title: S.of(context).favorites),
          ],
          body: Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(AppImages.noDataFound),
                ),
                Text(
                  S.of(context).nothingFound,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    S.of(context).addTheFirstDishToYourFavorites,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
