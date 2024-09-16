import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../ui/screens.dart';

part 'go_router.g.dart';

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}

@TypedGoRoute<AboutAppRoute>(path: '/about')
class AboutAppRoute extends GoRouteData {
  const AboutAppRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AboutScreen();
  }
}

@TypedGoRoute<LessonsRoute>(path: '/lessons')
class LessonsRoute extends GoRouteData {
  const LessonsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LessonsScreen();
  }
}

@TypedGoRoute<LessonRoute>(path: '/lessons/:id')
class LessonRoute extends GoRouteData {
  const LessonRoute({
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LessonLayout(lessonId: id);
  }
}

@TypedGoRoute<QuizzesRoute>(path: '/quizzes')
class QuizzesRoute extends GoRouteData {
  const QuizzesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const QuizzesScreen();
  }
}

@TypedGoRoute<OfferRoute>(path: '/offer')
class OfferRoute extends GoRouteData {
  const OfferRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SubscriptionOfferScreen();
  }
}

// ----------------- Router -----------------

GoRouter buildRouter(BuildContext context) {
  return GoRouter(
    initialLocation: '/splash',
    routes: $appRoutes,
    errorBuilder: (context, state) {
      return GoRouterErrorRoute().build(context, state);
    },
  );
}

@TypedGoRoute<GoRouterErrorRoute>(path: '/error')
class GoRouterErrorRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Center(
        child: Text('Route not found ${state.uri}'),
      ),
    );
  }
}
