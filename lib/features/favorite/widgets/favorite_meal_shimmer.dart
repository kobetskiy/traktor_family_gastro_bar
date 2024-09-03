import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class FavoriteMealShimmer extends StatefulWidget {
  const FavoriteMealShimmer({super.key});

  @override
  State<FavoriteMealShimmer> createState() => _FavoriteMealShimmerState();
}

class _FavoriteMealShimmerState extends State<FavoriteMealShimmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarWidget(title: S.of(context).favorites),
          ],
          body: Shimmer(
            child: ShimmerLoading(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: 5,
                itemBuilder: (_, __) => const _ShimmeredBanner(),
                separatorBuilder: (_, __) => const SizedBox(height: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ShimmeredBanner extends StatelessWidget {
  const _ShimmeredBanner();
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 300),
      child: AspectRatio(
        aspectRatio: 3 / 1,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
