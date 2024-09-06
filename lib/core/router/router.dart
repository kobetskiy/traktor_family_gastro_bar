import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/app_screen.dart';
import 'package:traktor_family_gastro_bar/features/auth/view/auth_screens.dart';
import 'package:traktor_family_gastro_bar/features/favorite/data/models/cart_meal_model.dart';
import 'package:traktor_family_gastro_bar/features/favorite/view/deliver_screens/deliver_screen.dart';
import 'package:traktor_family_gastro_bar/features/favorite/view/favorite_screen.dart';
import 'package:traktor_family_gastro_bar/features/favorite/view/reserve_screens/reserve_screen.dart';
import 'package:traktor_family_gastro_bar/features/home/view/banner_screen.dart';
import 'package:traktor_family_gastro_bar/features/home/view/home_screen.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/view/meals_list_screen.dart';
import 'package:traktor_family_gastro_bar/features/settings/view/main_section_screens/main_section_screens.dart';
import 'package:traktor_family_gastro_bar/features/settings/view/more_section_screens/more_section_screens.dart';
import 'package:traktor_family_gastro_bar/features/settings/view/settings_screen.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/sending_result_screen.dart';

import 'guards/guards.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        // home routes
        AutoRoute(path: '/banner', page: BannerRoute.page),
        AutoRoute(
          page: AppRoute.page,
          path: '/',
          guards: [AuthGuard()],
          children: [
            AutoRoute(path: 'home', page: HomeRoute.page),
            AutoRoute(path: 'meals_list', page: MealsListRoute.page),
            AutoRoute(
              path: 'favorite',
              page: FavoriteRoute.page,
              maintainState: false,
            ),
            AutoRoute(path: 'settings', page: SettingsRoute.page),
          ],
        ),

        // favorite routes
        AutoRoute(path: '/deliver_screen', page: DeliverRoute.page),
        AutoRoute(path: '/reserve_screen', page: ReserveRoute.page),

        // settings routes
        AutoRoute(
          path: '/personal_information',
          page: PersonalInformationRoute.page,
        ),
        AutoRoute(path: '/notification', page: NotificationRoute.page),
        AutoRoute(path: '/language', page: LanguageRoute.page),
        AutoRoute(path: '/theme', page: ThemeRoute.page),
        AutoRoute(path: '/report_bug', page: ReportBugRoute.page),
        AutoRoute(path: '/write_review', page: WriteReviewRoute.page),
        AutoRoute(path: '/privacy_policy', page: PrivacyPolicyRoute.page),
        AutoRoute(path: '/faq', page: FAQRoute.page),
        AutoRoute(path: '/sending_result', page: SendingResultRoute.page),

        // auth routes
        AutoRoute(path: '/on_boarding', page: OnBoardingRoute.page),
        AutoRoute(path: '/log_in', page: LogInRoute.page),
        AutoRoute(path: '/sign_up', page: SignUpRoute.page),
        AutoRoute(path: '/reset_password', page: ResetPasswordRoute.page),
      ];
}
