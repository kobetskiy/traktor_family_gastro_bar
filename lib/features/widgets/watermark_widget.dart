import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors_constants.dart';
import 'package:traktor_family_gastro_bar/features/data/services/url_launcher_service.dart';

class WatermarkWidget extends StatelessWidget {
  const WatermarkWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final urlLauncherService = UrlLauncherService();
    final uri = Uri.parse(urlLauncherService.creatorInstagram);

    return Column(
      children: [
        const SizedBox(height: 20),
        Center(
          child: GestureDetector(
            onTap: () => urlLauncherService.openLink(context, uri),
            child: Text(
              "Made by @kobetskiy.dev",
              style: TextStyle(color: AppColors.subtitleColor),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
