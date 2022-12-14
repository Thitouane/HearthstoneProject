// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:projet/data/models/card_hs.dart' as _i6;
import 'package:projet/view/cardhs_detail_page.dart' as _i2;
import 'package:projet/view/favorite_page.dart' as _i3;
import 'package:projet/view/home_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.HomePage(
          key: args.key,
          set: args.set,
        ),
      );
    },
    CardHSDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CardHSDetailRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.CardHSDetailPage(
          key: args.key,
          card: args.card,
        ),
      );
    },
    FavoriteRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.FavoritePage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          CardHSDetailRoute.name,
          path: '/card-hs-detail-page',
        ),
        _i4.RouteConfig(
          FavoriteRoute.name,
          path: '/favorite-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i5.Key? key,
    String? set,
  }) : super(
          HomeRoute.name,
          path: '/',
          args: HomeRouteArgs(
            key: key,
            set: set,
          ),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.set,
  });

  final _i5.Key? key;

  final String? set;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, set: $set}';
  }
}

/// generated route for
/// [_i2.CardHSDetailPage]
class CardHSDetailRoute extends _i4.PageRouteInfo<CardHSDetailRouteArgs> {
  CardHSDetailRoute({
    _i5.Key? key,
    required _i6.CardHS card,
  }) : super(
          CardHSDetailRoute.name,
          path: '/card-hs-detail-page',
          args: CardHSDetailRouteArgs(
            key: key,
            card: card,
          ),
        );

  static const String name = 'CardHSDetailRoute';
}

class CardHSDetailRouteArgs {
  const CardHSDetailRouteArgs({
    this.key,
    required this.card,
  });

  final _i5.Key? key;

  final _i6.CardHS card;

  @override
  String toString() {
    return 'CardHSDetailRouteArgs{key: $key, card: $card}';
  }
}

/// generated route for
/// [_i3.FavoritePage]
class FavoriteRoute extends _i4.PageRouteInfo<void> {
  const FavoriteRoute()
      : super(
          FavoriteRoute.name,
          path: '/favorite-page',
        );

  static const String name = 'FavoriteRoute';
}
