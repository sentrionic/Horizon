import 'package:auto_route/auto_route.dart';
import 'package:horizon/presentation/auth/login/login_screen.dart';
import 'package:horizon/presentation/auth/register/register_screen.dart';
import 'package:horizon/presentation/auth/start_up_screen.dart';
import 'package:horizon/presentation/main/account/account_screen.dart';
import 'package:horizon/presentation/main/artist/artist_screen.dart';
import 'package:horizon/presentation/main/home/home_screen.dart';
import 'package:horizon/presentation/main/home/widgets/home_songs_page.dart';
import 'package:horizon/presentation/main/liked_songs/liked_songs_screen.dart';
import 'package:horizon/presentation/main/main_screen.dart';
import 'package:horizon/presentation/main/playlist/playlist_screen.dart';
import 'package:horizon/presentation/main/search/search_screen.dart';
import 'package:horizon/presentation/main/search/widgets/artists_page.dart';
import 'package:horizon/presentation/main/search/widgets/songs_page.dart';
import 'package:horizon/presentation/routes/router.gr.dart';
import 'package:horizon/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    CustomRoute(
      page: StartUpScreen,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: LoginScreen,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: RegisterScreen,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: MainScreen,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: HomeScreen,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: SearchScreen,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: PlaylistScreen,
      path: "${PlaylistScreenRoute.name}/:id",
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: LikedSongsScreen,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: AccountScreen,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: ArtistScreen,
      path: "${ArtistScreenRoute.name}/:id",
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: SongsPage,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: ArtistsPage,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: HomeSongsPage,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
  ],
)
class $AppRouter {}
