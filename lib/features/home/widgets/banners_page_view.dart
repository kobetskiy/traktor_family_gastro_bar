import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/home/bloc/banner_bloc/banner_bloc.dart';
import 'package:traktor_family_gastro_bar/features/home/data/models/banner_model.dart';
import 'package:traktor_family_gastro_bar/features/home/data/service/banner_service.dart';

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
        const SizedBox(height: 15),
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
    final bannerService = BannerService();
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 300),
        child: AspectRatio(
          aspectRatio: 2.13 / 1,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Material(
                    child: Ink.image(
                      image: NetworkImage(bannerModel.imageURL),
                      fit: BoxFit.fitHeight,
                      child: InkWell(
                        onTap: () => bannerService.navigateTo(
                          context: context,
                          bannerTitle: bannerModel.title,
                          bannerContent: bannerModel.content,
                          bannerAppBarTitle: bannerModel.appBarTitle,
                        ),
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
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
    return Column(
      children: [
        widget.controller.length > 1
            ? Center(
                child: TabPageSelector(controller: widget.controller),
              )
            : const SizedBox.shrink(),
        widget.controller.length > 1
            ? const SizedBox(height: 15)
            : const SizedBox.shrink(),
      ],
    );
  }
}
