import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/widgets/shimmer.dart';

class BannerShimmerLoading extends StatefulWidget {
  const BannerShimmerLoading({super.key});

  @override
  State<BannerShimmerLoading> createState() => _BannerShimmerLoadingState();
}

class _BannerShimmerLoadingState extends State<BannerShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    return const Shimmer(
      child: ShimmerLoading(
        isLoading: true,
        child: Column(
          children: [
            _ShimmeredBanner(),
            SizedBox(height: 20),
          ],
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
        aspectRatio: 2.13 / 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
