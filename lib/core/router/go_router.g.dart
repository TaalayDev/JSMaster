// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'go_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashRoute,
      $aboutAppRoute,
      $lessonsRoute,
      $lessonRoute,
      $quizzesRoute,
      $offerRoute,
      $goRouterErrorRoute,
    ];

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/splash',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $aboutAppRoute => GoRouteData.$route(
      path: '/about',
      factory: $AboutAppRouteExtension._fromState,
    );

extension $AboutAppRouteExtension on AboutAppRoute {
  static AboutAppRoute _fromState(GoRouterState state) => const AboutAppRoute();

  String get location => GoRouteData.$location(
        '/about',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $lessonsRoute => GoRouteData.$route(
      path: '/lessons',
      factory: $LessonsRouteExtension._fromState,
    );

extension $LessonsRouteExtension on LessonsRoute {
  static LessonsRoute _fromState(GoRouterState state) => const LessonsRoute();

  String get location => GoRouteData.$location(
        '/lessons',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $lessonRoute => GoRouteData.$route(
      path: '/lessons/:id',
      factory: $LessonRouteExtension._fromState,
    );

extension $LessonRouteExtension on LessonRoute {
  static LessonRoute _fromState(GoRouterState state) => LessonRoute(
        id: state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/lessons/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $quizzesRoute => GoRouteData.$route(
      path: '/quizzes',
      factory: $QuizzesRouteExtension._fromState,
    );

extension $QuizzesRouteExtension on QuizzesRoute {
  static QuizzesRoute _fromState(GoRouterState state) => const QuizzesRoute();

  String get location => GoRouteData.$location(
        '/quizzes',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $offerRoute => GoRouteData.$route(
      path: '/offer',
      factory: $OfferRouteExtension._fromState,
    );

extension $OfferRouteExtension on OfferRoute {
  static OfferRoute _fromState(GoRouterState state) => const OfferRoute();

  String get location => GoRouteData.$location(
        '/offer',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $goRouterErrorRoute => GoRouteData.$route(
      path: '/error',
      factory: $GoRouterErrorRouteExtension._fromState,
    );

extension $GoRouterErrorRouteExtension on GoRouterErrorRoute {
  static GoRouterErrorRoute _fromState(GoRouterState state) =>
      GoRouterErrorRoute();

  String get location => GoRouteData.$location(
        '/error',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
