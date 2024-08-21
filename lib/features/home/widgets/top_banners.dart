import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traktor_family_gastro_bar/features/home/bloc/banner_bloc/banner_bloc.dart';
import 'package:traktor_family_gastro_bar/features/home/widgets/index.dart';
import 'package:traktor_family_gastro_bar/features/home/widgets/shimmer_affect_widgets/banner_shimmer_loading.dart';

class TopBanners extends StatefulWidget {
  const TopBanners({super.key});

  @override
  State<TopBanners> createState() => _JapaneseCuisineTabState();
}

class _JapaneseCuisineTabState extends State<TopBanners> {
  final _bannerBloc = BannerBloc();

  @override
  void initState() {
    super.initState();
    _bannerBloc.add(LoadBannersList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      bloc: _bannerBloc,
      builder: (context, state) {
        if (state is BannerSuccess) {
          return BannersPageView(state: state);
        }
        if (state is BannerFailure) {
          return const SizedBox.shrink();
        }
        return const BannerShimmerLoading();
      },
    );
  }
}
