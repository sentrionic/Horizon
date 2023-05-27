import 'package:auto_route/auto_route.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: SplashRoute.page,
          initial: true,
          path: "/",
        ),
        CustomRoute(
          page: StartUpRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: LoginRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: RegisterRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: MainRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: HomeRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: SearchRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: PlaylistRoute.page,
          path: "/${PlaylistRoute.name}/:id",
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: LikedSongsRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: AccountRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: ArtistRoute.page,
          path: "/${ArtistRoute.name}/:id",
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: SongsRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: ArtistRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: HomeSongsRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
      ];
}
