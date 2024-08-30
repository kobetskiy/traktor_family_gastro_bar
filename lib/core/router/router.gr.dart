// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AppScreen]
class AppRoute extends PageRouteInfo<void> {
  const AppRoute({List<PageRouteInfo>? children})
      : super(
          AppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppScreen();
    },
  );
}

/// generated route for
/// [BannerScreen]
class BannerRoute extends PageRouteInfo<BannerRouteArgs> {
  BannerRoute({
    Key? key,
    required String title,
    required String content,
    required String appBarTitle,
    List<PageRouteInfo>? children,
  }) : super(
          BannerRoute.name,
          args: BannerRouteArgs(
            key: key,
            title: title,
            content: content,
            appBarTitle: appBarTitle,
          ),
          initialChildren: children,
        );

  static const String name = 'BannerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BannerRouteArgs>();
      return BannerScreen(
        key: args.key,
        title: args.title,
        content: args.content,
        appBarTitle: args.appBarTitle,
      );
    },
  );
}

class BannerRouteArgs {
  const BannerRouteArgs({
    this.key,
    required this.title,
    required this.content,
    required this.appBarTitle,
  });

  final Key? key;

  final String title;

  final String content;

  final String appBarTitle;

  @override
  String toString() {
    return 'BannerRouteArgs{key: $key, title: $title, content: $content, appBarTitle: $appBarTitle}';
  }
}

/// generated route for
/// [FAQScreen]
class FAQRoute extends PageRouteInfo<void> {
  const FAQRoute({List<PageRouteInfo>? children})
      : super(
          FAQRoute.name,
          initialChildren: children,
        );

  static const String name = 'FAQRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FAQScreen();
    },
  );
}

/// generated route for
/// [FavoriteScreen]
class FavoriteRoute extends PageRouteInfo<void> {
  const FavoriteRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavoriteScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LanguageScreen]
class LanguageRoute extends PageRouteInfo<void> {
  const LanguageRoute({List<PageRouteInfo>? children})
      : super(
          LanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LanguageScreen();
    },
  );
}

/// generated route for
/// [MealsListScreen]
class MealsListRoute extends PageRouteInfo<void> {
  const MealsListRoute({List<PageRouteInfo>? children})
      : super(
          MealsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'MealsListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MealsListScreen();
    },
  );
}

/// generated route for
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationScreen();
    },
  );
}

/// generated route for
/// [PersonalInformationScreen]
class PersonalInformationRoute extends PageRouteInfo<void> {
  const PersonalInformationRoute({List<PageRouteInfo>? children})
      : super(
          PersonalInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonalInformationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PersonalInformationScreen();
    },
  );
}

/// generated route for
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PrivacyPolicyScreen();
    },
  );
}

/// generated route for
/// [ReportBugScreen]
class ReportBugRoute extends PageRouteInfo<void> {
  const ReportBugRoute({List<PageRouteInfo>? children})
      : super(
          ReportBugRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportBugRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ReportBugScreen();
    },
  );
}

/// generated route for
/// [SendingResultScreen]
class SendingResultRoute extends PageRouteInfo<SendingResultRouteArgs> {
  SendingResultRoute({
    Key? key,
    required String title,
    required String subtitle,
    bool isSuccess = true,
    List<PageRouteInfo>? children,
  }) : super(
          SendingResultRoute.name,
          args: SendingResultRouteArgs(
            key: key,
            title: title,
            subtitle: subtitle,
            isSuccess: isSuccess,
          ),
          initialChildren: children,
        );

  static const String name = 'SendingResultRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SendingResultRouteArgs>();
      return SendingResultScreen(
        key: args.key,
        title: args.title,
        subtitle: args.subtitle,
        isSuccess: args.isSuccess,
      );
    },
  );
}

class SendingResultRouteArgs {
  const SendingResultRouteArgs({
    this.key,
    required this.title,
    required this.subtitle,
    this.isSuccess = true,
  });

  final Key? key;

  final String title;

  final String subtitle;

  final bool isSuccess;

  @override
  String toString() {
    return 'SendingResultRouteArgs{key: $key, title: $title, subtitle: $subtitle, isSuccess: $isSuccess}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}

/// generated route for
/// [ThemeScreen]
class ThemeRoute extends PageRouteInfo<void> {
  const ThemeRoute({List<PageRouteInfo>? children})
      : super(
          ThemeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThemeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ThemeScreen();
    },
  );
}

/// generated route for
/// [WriteReviewScreen]
class WriteReviewRoute extends PageRouteInfo<void> {
  const WriteReviewRoute({List<PageRouteInfo>? children})
      : super(
          WriteReviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'WriteReviewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WriteReviewScreen();
    },
  );
}
