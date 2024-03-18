import 'package:flutter/material.dart';

class TopBanners extends StatelessWidget {
  const TopBanners({super.key, required this.tabController});

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        onPageChanged: (index) => tabController!.index = index,
        itemCount: 5,
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            onTap: () {},
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              width: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.white12,
              ),
              child: const Center(child: Text('Image banner here')),
            ),
          ),
        ),
      ),
    );
  }
}
