import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/data/services/constants.dart';
import 'package:traktor_family_gastro_bar/features/home/bloc/banner_bloc/banner_bloc.dart';
import 'package:traktor_family_gastro_bar/features/home/data/models/banner_model.dart';
import 'package:traktor_family_gastro_bar/features/home/view/banner_screen.dart';

class BannersPageView extends StatefulWidget {
  const BannersPageView({super.key, required this.state});

  final BannerSuccess state;

  @override
  State<BannersPageView> createState() => _BannersPageViewState();
}

class _BannersPageViewState extends State<BannersPageView>
    with TickerProviderStateMixin {
  late TabController bannerController;

  @override
  void initState() {
    super.initState();
    bannerController = TabController(
      length: widget.state.data.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _BannersList(state: widget.state, controller: bannerController),
        const SizedBox(height: 5),
        _BannerPageSelectors(controller: bannerController),
      ],
    );
  }
}

class _BannersList extends StatelessWidget {
  const _BannersList({required this.state, required this.controller});

  final BannerSuccess state;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 300),
        child: AspectRatio(
          aspectRatio: 1.89 / 1,
          child: PageView.builder(
            onPageChanged: (index) => controller.index = index,
            itemCount: controller.length,
            itemBuilder: (_, int index) {
              BannerModel bannerModel = BannerModel(
                title: state.data[index]['title'],
                content: state.data[index]['content'],
                appBarTitle: state.data[index]['appBarTitle'],
                imageURL: state.data[index]['imageURL'],
              );

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Material(
                      child: InkWell(
                        onTap: () => Constants.navigateTo(
                          context,
                          BannerScreen(
                            title: bannerModel.title,
                            content: bannerModel.content,
                            appBarTitle: bannerModel.appBarTitle,
                          ),
                        ),
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: bannerModel.imageURL,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _BannerPageSelectors extends StatefulWidget {
  const _BannerPageSelectors({required this.controller});

  final TabController controller;

  @override
  State<_BannerPageSelectors> createState() => _BannerPageSelectorsState();
}

class _BannerPageSelectorsState extends State<_BannerPageSelectors> {
  @override
  Widget build(BuildContext context) {
    return widget.controller.length > 1
        ? Center(
            child: TabPageSelector(controller: widget.controller),
          )
        : const SizedBox.shrink();
  }
}
