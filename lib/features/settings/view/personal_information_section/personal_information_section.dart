import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/router/router.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/auth/services/auth_service.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_sections/settings_section.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class PersonalInformationSection extends StatelessWidget {
  const PersonalInformationSection({super.key});

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
          onTap: () => context.router.push(
              auth.currentUser != null
                  ? const PersonalInformationRoute()
                  : const LogInRoute()),
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
                FutureBuilder(
                  future: AuthService.getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Error loading user data'),
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width - 170,
                          child: Text(
                            auth.currentUser != null
                                ? snapshot.data?.name ?? '...' // TODO: fix name display. dont update ui after changing data in firestore
                                : S.of(context).logIn,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 22),
                          ),
                        ),
                        auth.currentUser != null
                            ? const SizedBox(height: 4)
                            : const SizedBox.shrink(),
                        auth.currentUser != null
                            ? Text(
                                snapshot.data?.email ?? '...',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.grey[600],
                                    ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    );
                  },
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
