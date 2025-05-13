import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:hello/home_page.dart';
import 'package:hello/second_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/', // Starting route
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage(title: 'Voice detect');
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/second',
          builder: (BuildContext context, GoRouterState state) {
            return const SecondPage(parameter: "hey");
          },
        ),
        GoRoute(
          path: '/second/:param',
          builder: (BuildContext context, GoRouterState state) {
            final String mParam =
                state.pathParameters['param'] ??
                'default'; //retrieve the parameter
            return SecondPage(parameter: mParam);
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) {
    return Scaffold(body: Center(child: Text('404: Route not found')));
  },
);
