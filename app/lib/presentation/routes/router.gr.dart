// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

import '../auth/login/login_screen.dart' as _i3;
import '../auth/register/register_screen.dart' as _i4;
import '../auth/start_up_screen.dart' as _i2;
import '../main/account/account_screen.dart' as _i10;
import '../main/artist/artist_screen.dart' as _i11;
import '../main/home/home_screen.dart' as _i6;
import '../main/home/widgets/home_songs_page.dart' as _i14;
import '../main/liked_songs/liked_songs_screen.dart' as _i9;
import '../main/main_screen.dart' as _i5;
import '../main/playlist/playlist_screen.dart' as _i8;
import '../main/search/search_screen.dart' as _i7;
import '../main/search/widgets/artists_page.dart' as _i13;
import '../main/search/widgets/songs_page.dart' as _i12;
import '../splash/splash_page.dart' as _i1;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.SplashPage());
    },
    StartUpScreenRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i2.StartUpScreen(),
          transitionsBuilder: _i15.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    LoginScreenRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.LoginScreen(),
          transitionsBuilder: _i15.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    RegisterScreenRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.RegisterScreen(),
          transitionsBuilder: _i15.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    MainScreenRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.MainScreen(),
          transitionsBuilder: _i15.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    HomeScreenRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.HomeScreen(),
          transitionsBuilder: _i15.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    SearchScreenRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.SearchScreen(),
          transitionsBuilder: _i15.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    PlaylistScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PlaylistScreenRouteArgs>(
          orElse: () =>
              PlaylistScreenRouteArgs(id: pathParams.getString('id')));
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i8.PlaylistScreen(key: args.key, id: args.id),
          transitionsBuilder: _i15.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    LikedSongsScreenRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i9.LikedSongsScreen(),
          transitionsBuilder: _i15.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    AccountScreenRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i10.AccountScreen(),
          transitionsBuilder: _i15.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    ArtistScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ArtistScreenRouteArgs>();
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i11.ArtistScreen(key: args.key, id: args.id),
          transitionsBuilder: _i15.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    SongsPageRoute.name: (routeData) {
      final args = routeData.argsAs<SongsPageRouteArgs>();
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i12.SongsPage(key: args.key, query: args.query),
          transitionsBuilder: _i15.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    ArtistsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ArtistsPageRouteArgs>();
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i13.ArtistsPage(key: args.key, query: args.query),
          transitionsBuilder: _i15.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    HomeSongsPageRoute.name: (routeData) {
      final args = routeData.argsAs<HomeSongsPageRouteArgs>();
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i14.HomeSongsPage(key: args.key, query: args.query),
          transitionsBuilder: _i15.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(SplashPageRoute.name, path: '/'),
        _i15.RouteConfig(StartUpScreenRoute.name, path: '/start-up-screen'),
        _i15.RouteConfig(LoginScreenRoute.name, path: '/login-screen'),
        _i15.RouteConfig(RegisterScreenRoute.name, path: '/register-screen'),
        _i15.RouteConfig(MainScreenRoute.name, path: '/main-screen'),
        _i15.RouteConfig(HomeScreenRoute.name, path: '/home-screen'),
        _i15.RouteConfig(SearchScreenRoute.name, path: '/search-screen'),
        _i15.RouteConfig(PlaylistScreenRoute.name,
            path: 'PlaylistScreenRoute/:id'),
        _i15.RouteConfig(LikedSongsScreenRoute.name,
            path: '/liked-songs-screen'),
        _i15.RouteConfig(AccountScreenRoute.name, path: '/account-screen'),
        _i15.RouteConfig(ArtistScreenRoute.name, path: 'ArtistScreenRoute/:id'),
        _i15.RouteConfig(SongsPageRoute.name, path: '/songs-page'),
        _i15.RouteConfig(ArtistsPageRoute.name, path: '/artists-page'),
        _i15.RouteConfig(HomeSongsPageRoute.name, path: '/home-songs-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i15.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: '/');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.StartUpScreen]
class StartUpScreenRoute extends _i15.PageRouteInfo<void> {
  const StartUpScreenRoute()
      : super(StartUpScreenRoute.name, path: '/start-up-screen');

  static const String name = 'StartUpScreenRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreenRoute extends _i15.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(LoginScreenRoute.name, path: '/login-screen');

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterScreenRoute extends _i15.PageRouteInfo<void> {
  const RegisterScreenRoute()
      : super(RegisterScreenRoute.name, path: '/register-screen');

  static const String name = 'RegisterScreenRoute';
}

/// generated route for
/// [_i5.MainScreen]
class MainScreenRoute extends _i15.PageRouteInfo<void> {
  const MainScreenRoute() : super(MainScreenRoute.name, path: '/main-screen');

  static const String name = 'MainScreenRoute';
}

/// generated route for
/// [_i6.HomeScreen]
class HomeScreenRoute extends _i15.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: '/home-screen');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i7.SearchScreen]
class SearchScreenRoute extends _i15.PageRouteInfo<void> {
  const SearchScreenRoute()
      : super(SearchScreenRoute.name, path: '/search-screen');

  static const String name = 'SearchScreenRoute';
}

/// generated route for
/// [_i8.PlaylistScreen]
class PlaylistScreenRoute extends _i15.PageRouteInfo<PlaylistScreenRouteArgs> {
  PlaylistScreenRoute({_i16.Key? key, required String id})
      : super(PlaylistScreenRoute.name,
            path: 'PlaylistScreenRoute/:id',
            args: PlaylistScreenRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'PlaylistScreenRoute';
}

class PlaylistScreenRouteArgs {
  const PlaylistScreenRouteArgs({this.key, required this.id});

  final _i16.Key? key;

  final String id;

  @override
  String toString() {
    return 'PlaylistScreenRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i9.LikedSongsScreen]
class LikedSongsScreenRoute extends _i15.PageRouteInfo<void> {
  const LikedSongsScreenRoute()
      : super(LikedSongsScreenRoute.name, path: '/liked-songs-screen');

  static const String name = 'LikedSongsScreenRoute';
}

/// generated route for
/// [_i10.AccountScreen]
class AccountScreenRoute extends _i15.PageRouteInfo<void> {
  const AccountScreenRoute()
      : super(AccountScreenRoute.name, path: '/account-screen');

  static const String name = 'AccountScreenRoute';
}

/// generated route for
/// [_i11.ArtistScreen]
class ArtistScreenRoute extends _i15.PageRouteInfo<ArtistScreenRouteArgs> {
  ArtistScreenRoute({_i16.Key? key, required String id})
      : super(ArtistScreenRoute.name,
            path: 'ArtistScreenRoute/:id',
            args: ArtistScreenRouteArgs(key: key, id: id));

  static const String name = 'ArtistScreenRoute';
}

class ArtistScreenRouteArgs {
  const ArtistScreenRouteArgs({this.key, required this.id});

  final _i16.Key? key;

  final String id;

  @override
  String toString() {
    return 'ArtistScreenRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i12.SongsPage]
class SongsPageRoute extends _i15.PageRouteInfo<SongsPageRouteArgs> {
  SongsPageRoute({_i16.Key? key, required String query})
      : super(SongsPageRoute.name,
            path: '/songs-page',
            args: SongsPageRouteArgs(key: key, query: query));

  static const String name = 'SongsPageRoute';
}

class SongsPageRouteArgs {
  const SongsPageRouteArgs({this.key, required this.query});

  final _i16.Key? key;

  final String query;

  @override
  String toString() {
    return 'SongsPageRouteArgs{key: $key, query: $query}';
  }
}

/// generated route for
/// [_i13.ArtistsPage]
class ArtistsPageRoute extends _i15.PageRouteInfo<ArtistsPageRouteArgs> {
  ArtistsPageRoute({_i16.Key? key, required String query})
      : super(ArtistsPageRoute.name,
            path: '/artists-page',
            args: ArtistsPageRouteArgs(key: key, query: query));

  static const String name = 'ArtistsPageRoute';
}

class ArtistsPageRouteArgs {
  const ArtistsPageRouteArgs({this.key, required this.query});

  final _i16.Key? key;

  final String query;

  @override
  String toString() {
    return 'ArtistsPageRouteArgs{key: $key, query: $query}';
  }
}

/// generated route for
/// [_i14.HomeSongsPage]
class HomeSongsPageRoute extends _i15.PageRouteInfo<HomeSongsPageRouteArgs> {
  HomeSongsPageRoute({_i16.Key? key, required _i14.SongQuery query})
      : super(HomeSongsPageRoute.name,
            path: '/home-songs-page',
            args: HomeSongsPageRouteArgs(key: key, query: query));

  static const String name = 'HomeSongsPageRoute';
}

class HomeSongsPageRouteArgs {
  const HomeSongsPageRouteArgs({this.key, required this.query});

  final _i16.Key? key;

  final _i14.SongQuery query;

  @override
  String toString() {
    return 'HomeSongsPageRouteArgs{key: $key, query: $query}';
  }
}
