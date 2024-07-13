import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/settings/view/personal_information_section/personal_information_screen.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_sections/settings_section.dart';

class PersonalInformationSection extends StatelessWidget {
  const PersonalInformationSection({super.key});

  void navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final iconsColor = Theme.of(context).brightness == Brightness.light
        ? Colors.black87
        : Colors.white;

    final auth = FirebaseAuth.instance;

    return SettingsSection(
      children: [
        InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onTap: () => navigateTo(context, const PersonalInformationScreen()),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppIcons.profile,
                  width: 24,
                  height: 24,
                  color: iconsColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width - 170,
                      child: Text(
                        auth.currentUser!.displayName!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 22),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      auth.currentUser!.email!,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded, color: iconsColor),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
