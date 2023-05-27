// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:horizon/presentation/auth/login/login_screen.dart' as _i1;
import 'package:horizon/presentation/auth/register/register_screen.dart' as _i2;
import 'package:horizon/presentation/auth/start_up_screen.dart' as _i3;
import 'package:horizon/presentation/main/account/account_screen.dart' as _i4;
import 'package:horizon/presentation/main/artist/artist_screen.dart' as _i5;
import 'package:horizon/presentation/main/home/home_screen.dart' as _i6;
import 'package:horizon/presentation/main/home/widgets/home_songs_page.dart'
    as _i7;
import 'package:horizon/presentation/main/liked_songs/liked_songs_screen.dart'
    as _i8;
import 'package:horizon/presentation/main/main_screen.dart' as _i9;
import 'package:horizon/presentation/main/playlist/playlist_screen.dart'
    as _i10;
import 'package:horizon/presentation/main/search/search_screen.dart' as _i11;
import 'package:horizon/presentation/main/search/widgets/artists_page.dart'
    as _i12;
import 'package:horizon/presentation/main/search/widgets/songs_page.dart'
    as _i13;
import 'package:horizon/presentation/splash/splash_page.dart' as _i14;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.LoginScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.RegisterScreen(),
      );
    },
    StartUpRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.StartUpScreen(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AccountScreen(),
      );
    },
    ArtistRoute.name: (routeData) {
      final args = routeData.argsAs<ArtistRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ArtistScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeScreen(),
      );
    },
    HomeSongsRoute.name: (routeData) {
      final args = routeData.argsAs<HomeSongsRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.HomeSongsPage(
          key: args.key,
          query: args.query,
        ),
      );
    },
    LikedSongsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LikedSongsScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.MainScreen(),
      );
    },
    PlaylistRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PlaylistRouteArgs>(
          orElse: () => PlaylistRouteArgs(id: pathParams.getString('id')));
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.PlaylistScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SearchScreen(),
      );
    },
    ArtistsRoute.name: (routeData) {
      final args = routeData.argsAs<ArtistsRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.ArtistsPage(
          key: args.key,
          query: args.query,
        ),
      );
    },
    SongsRoute.name: (routeData) {
      final args = routeData.argsAs<SongsRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.SongsPage(
          key: args.key,
          query: args.query,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute({List<_i15.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.RegisterScreen]
class RegisterRoute extends _i15.PageRouteInfo<void> {
  const RegisterRoute({List<_i15.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.StartUpScreen]
class StartUpRoute extends _i15.PageRouteInfo<void> {
  const StartUpRoute({List<_i15.PageRouteInfo>? children})
      : super(
          StartUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartUpRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AccountScreen]
class AccountRoute extends _i15.PageRouteInfo<void> {
  const AccountRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ArtistScreen]
class ArtistRoute extends _i15.PageRouteInfo<ArtistRouteArgs> {
  ArtistRoute({
    _i16.Key? key,
    required String id,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          ArtistRoute.name,
          args: ArtistRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'ArtistRoute';

  static const _i15.PageInfo<ArtistRouteArgs> page =
      _i15.PageInfo<ArtistRouteArgs>(name);
}

class ArtistRouteArgs {
  const ArtistRouteArgs({
    this.key,
    required this.id,
  });

  final _i16.Key? key;

  final String id;

  @override
  String toString() {
    return 'ArtistRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeSongsPage]
class HomeSongsRoute extends _i15.PageRouteInfo<HomeSongsRouteArgs> {
  HomeSongsRoute({
    _i16.Key? key,
    required _i7.SongQuery query,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          HomeSongsRoute.name,
          args: HomeSongsRouteArgs(
            key: key,
            query: query,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeSongsRoute';

  static const _i15.PageInfo<HomeSongsRouteArgs> page =
      _i15.PageInfo<HomeSongsRouteArgs>(name);
}

class HomeSongsRouteArgs {
  const HomeSongsRouteArgs({
    this.key,
    required this.query,
  });

  final _i16.Key? key;

  final _i7.SongQuery query;

  @override
  String toString() {
    return 'HomeSongsRouteArgs{key: $key, query: $query}';
  }
}

/// generated route for
/// [_i8.LikedSongsScreen]
class LikedSongsRoute extends _i15.PageRouteInfo<void> {
  const LikedSongsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          LikedSongsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LikedSongsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MainScreen]
class MainRoute extends _i15.PageRouteInfo<void> {
  const MainRoute({List<_i15.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PlaylistScreen]
class PlaylistRoute extends _i15.PageRouteInfo<PlaylistRouteArgs> {
  PlaylistRoute({
    _i16.Key? key,
    required String id,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          PlaylistRoute.name,
          args: PlaylistRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'PlaylistRoute';

  static const _i15.PageInfo<PlaylistRouteArgs> page =
      _i15.PageInfo<PlaylistRouteArgs>(name);
}

class PlaylistRouteArgs {
  const PlaylistRouteArgs({
    this.key,
    required this.id,
  });

  final _i16.Key? key;

  final String id;

  @override
  String toString() {
    return 'PlaylistRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i11.SearchScreen]
class SearchRoute extends _i15.PageRouteInfo<void> {
  const SearchRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ArtistsPage]
class ArtistsRoute extends _i15.PageRouteInfo<ArtistsRouteArgs> {
  ArtistsRoute({
    _i16.Key? key,
    required String query,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          ArtistsRoute.name,
          args: ArtistsRouteArgs(
            key: key,
            query: query,
          ),
          initialChildren: children,
        );

  static const String name = 'ArtistsRoute';

  static const _i15.PageInfo<ArtistsRouteArgs> page =
      _i15.PageInfo<ArtistsRouteArgs>(name);
}

class ArtistsRouteArgs {
  const ArtistsRouteArgs({
    this.key,
    required this.query,
  });

  final _i16.Key? key;

  final String query;

  @override
  String toString() {
    return 'ArtistsRouteArgs{key: $key, query: $query}';
  }
}

/// generated route for
/// [_i13.SongsPage]
class SongsRoute extends _i15.PageRouteInfo<SongsRouteArgs> {
  SongsRoute({
    _i16.Key? key,
    required String query,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          SongsRoute.name,
          args: SongsRouteArgs(
            key: key,
            query: query,
          ),
          initialChildren: children,
        );

  static const String name = 'SongsRoute';

  static const _i15.PageInfo<SongsRouteArgs> page =
      _i15.PageInfo<SongsRouteArgs>(name);
}

class SongsRouteArgs {
  const SongsRouteArgs({
    this.key,
    required this.query,
  });

  final _i16.Key? key;

  final String query;

  @override
  String toString() {
    return 'SongsRouteArgs{key: $key, query: $query}';
  }
}

/// generated route for
/// [_i14.SplashPage]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
