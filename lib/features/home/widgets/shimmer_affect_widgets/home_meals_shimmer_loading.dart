import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/widgets/shimmer.dart';

class HomeMealsShimmerLoading extends StatefulWidget {
  const HomeMealsShimmerLoading({super.key});

  @override
  State<HomeMealsShimmerLoading> createState() =>
      _HomeMealsShimmerLoadingState();
}

class _HomeMealsShimmerLoadingState extends State<HomeMealsShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: ShimmerLoading(
        isLoading: true,
        child: SizedBox(
          height: 180,
          child: ListView.separated(
            itemCount: 7,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, __) => const _ShimmeredMeal(),
            separatorBuilder: (_, __) => const SizedBox(width: 20),
          ),
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
      width: 155,
      height: 185,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
