import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/widgets/shimmer.dart';

class CategoriesMealsShimmerLoading extends StatefulWidget {
  const CategoriesMealsShimmerLoading({super.key});

  @override
  State<CategoriesMealsShimmerLoading> createState() =>
      _CategoriesMealsShimmerLoadingState();
}

class _CategoriesMealsShimmerLoadingState
    extends State<CategoriesMealsShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: ShimmerLoading(
        child: ListView.separated(
          itemCount: 10,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemBuilder: (_, __) => const _ShimmeredMeal(),
          separatorBuilder: (_, __) => const SizedBox(height: 10),
        ),
      ),
    );
  }
}

class _ShimmeredMeal extends StatelessWidget {
  const _ShimmeredMeal();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
