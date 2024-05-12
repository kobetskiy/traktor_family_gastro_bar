import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/images_constants.dart';
import 'package:traktor_family_gastro_bar/features/home/data/service/banner_service.dart';

class TopBanners extends StatelessWidget {
  const TopBanners({super.key, required this.bannerController});

  final TabController? bannerController;

  @override
  Widget build(BuildContext context) {
    final bannerService = BannerService();

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 300),
        child: AspectRatio(
          aspectRatio: 2.13 / 1,
          child: PageView.builder(
            onPageChanged: (index) => bannerController!.index = index,
            itemCount: 3,
            itemBuilder: (_, int index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Material(
                  child: Ink.image(
                    image: AssetImage(AppImages.banners[index]),
                    fit: BoxFit.fitHeight,
                    child: InkWell(
                      onTap: () => bannerService.navigateTo(context, index),
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
