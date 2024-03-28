import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/images.dart';

class TopBanners extends StatelessWidget {
  const TopBanners({super.key, required this.tabController});

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: PageView.builder(
          onPageChanged: (index) => tabController!.index = index,
          itemCount: 3,
          itemBuilder: (_, int index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Material(
                child: Ink.image(
                  image: AssetImage(AppImages.banners[index]),
                  fit: BoxFit.fitHeight,
                  // child: InkWell(
                  //   onTap: () {},
                  //   customBorder: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(15),
                  //   ),
                  // ),
                  // ! think about adding callback on banner
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
