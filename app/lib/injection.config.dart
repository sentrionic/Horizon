// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:grpc/grpc.dart' as _i5;
import 'package:horizon/application/artist/get_artist/get_artist_cubit.dart'
    as _i35;
import 'package:horizon/application/artist/search_artists/search_artists_cubit.dart'
    as _i26;
import 'package:horizon/application/audio_player/audio_player_cubit.dart'
    as _i4;
import 'package:horizon/application/auth/account/account_cubit.dart' as _i3;
import 'package:horizon/application/auth/auth_status/auth_status_bloc.dart'
    as _i31;
import 'package:horizon/application/auth/login_form/login_form_cubit.dart'
    as _i21;
import 'package:horizon/application/auth/register_form/register_form_cubit.dart'
    as _i24;
import 'package:horizon/application/auth/update_account/update_account_cubit.dart'
    as _i29;
import 'package:horizon/application/playlists/add_song/add_song_cubit.dart'
    as _i30;
import 'package:horizon/application/playlists/create_playlist/create_playlist_cubit.dart'
    as _i32;
import 'package:horizon/application/playlists/delete_playlist/delete_playlist_cubit.dart'
    as _i33;
import 'package:horizon/application/playlists/edit_playlist/edit_playlist_cubit.dart'
    as _i34;
import 'package:horizon/application/playlists/playlist_list/playlist_list_cubit.dart'
    as _i22;
import 'package:horizon/application/playlists/playlist_songs/playlist_songs_cubit.dart'
    as _i23;
import 'package:horizon/application/playlists/remove_song/remove_song_cubit.dart'
    as _i25;
import 'package:horizon/application/songs/home_songs/home_songs_cubit.dart'
    as _i36;
import 'package:horizon/application/songs/increment_playcount/increment_playcount_cubit.dart'
    as _i19;
import 'package:horizon/application/songs/liked_songs/liked_songs_cubit.dart'
    as _i20;
import 'package:horizon/application/songs/song_list/song_list_cubit.dart'
    as _i27;
import 'package:horizon/application/songs/toggle_like/toggle_like_cubit.dart'
    as _i28;
import 'package:horizon/domain/artist/i_artist_repository.dart' as _i11;
import 'package:horizon/domain/auth/i_auth_facade.dart' as _i13;
import 'package:horizon/domain/playlists/i_playlist_repository.dart' as _i15;
import 'package:horizon/domain/songs/i_song_repository.dart' as _i17;
import 'package:horizon/infrastructure/artist/artist_repository.dart' as _i12;
import 'package:horizon/infrastructure/auth/auth_facade.dart' as _i14;
import 'package:horizon/infrastructure/core/injectable_module.dart' as _i37;
import 'package:horizon/infrastructure/playlists/playlist_repository.dart'
    as _i16;
import 'package:horizon/infrastructure/proto/artist_service.pbgrpc.dart' as _i9;
import 'package:horizon/infrastructure/proto/auth_service.pbgrpc.dart' as _i10;
import 'package:horizon/infrastructure/proto/playlist_service.pbgrpc.dart'
    as _i7;
import 'package:horizon/infrastructure/proto/song_service.pbgrpc.dart' as _i8;
import 'package:horizon/infrastructure/songs/song_repository.dart' as _i18;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.factory<_i3.AccountCubit>(() => _i3.AccountCubit());
    gh.factory<_i4.AudioPlayerCubit>(() => _i4.AudioPlayerCubit());
    await gh.lazySingletonAsync<_i5.ClientChannel>(
      () => injectableModule.channel,
      preResolve: true,
    );
    gh.lazySingleton<_i6.FlutterSecureStorage>(
        () => injectableModule.storage());
    gh.lazySingleton<_i7.PlaylistClient>(
        () => injectableModule.playlistClient(gh<_i5.ClientChannel>()));
    gh.lazySingleton<_i8.SongClient>(
        () => injectableModule.songClient(gh<_i5.ClientChannel>()));
    gh.factory<String>(
      () => injectableModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<String>(
      () => injectableModule.authority,
      instanceName: 'Authority',
    );
    gh.factory<int>(
      () => injectableModule.port,
      instanceName: 'Port',
    );
    gh.lazySingleton<_i9.ArtistClient>(
        () => injectableModule.artistClient(gh<_i5.ClientChannel>()));
    gh.lazySingleton<_i10.AuthClient>(
        () => injectableModule.authClient(gh<_i5.ClientChannel>()));
    gh.lazySingleton<_i11.IArtistRepository>(() => _i12.ArtistRepository(
          gh<_i9.ArtistClient>(),
          gh<_i6.FlutterSecureStorage>(),
        ));
    gh.lazySingleton<_i13.IAuthFacade>(() => _i14.AuthFacade(
          gh<_i10.AuthClient>(),
          gh<_i6.FlutterSecureStorage>(),
        ));
    gh.lazySingleton<_i15.IPlaylistRepository>(() => _i16.PlaylistRepository(
          gh<_i7.PlaylistClient>(),
          gh<_i6.FlutterSecureStorage>(),
        ));
    gh.lazySingleton<_i17.ISongRepository>(() => _i18.SongRepository(
          gh<_i8.SongClient>(),
          gh<_i6.FlutterSecureStorage>(),
        ));
    gh.factory<_i19.IncrementPlaycountCubit>(
        () => _i19.IncrementPlaycountCubit(gh<_i17.ISongRepository>()));
    gh.factory<_i20.LikedSongsCubit>(
        () => _i20.LikedSongsCubit(gh<_i17.ISongRepository>()));
    gh.factory<_i21.LoginFormCubit>(
        () => _i21.LoginFormCubit(gh<_i13.IAuthFacade>()));
    gh.factory<_i22.PlaylistListCubit>(
        () => _i22.PlaylistListCubit(gh<_i15.IPlaylistRepository>()));
    gh.factory<_i23.PlaylistSongsCubit>(
        () => _i23.PlaylistSongsCubit(gh<_i15.IPlaylistRepository>()));
    gh.factory<_i24.RegisterFormCubit>(
        () => _i24.RegisterFormCubit(gh<_i13.IAuthFacade>()));
    gh.factory<_i25.RemoveSongCubit>(
        () => _i25.RemoveSongCubit(gh<_i15.IPlaylistRepository>()));
    gh.factory<_i26.SearchArtistsCubit>(
        () => _i26.SearchArtistsCubit(gh<_i11.IArtistRepository>()));
    gh.factory<_i27.SongListCubit>(
        () => _i27.SongListCubit(gh<_i17.ISongRepository>()));
    gh.factory<_i28.ToggleLikeCubit>(
        () => _i28.ToggleLikeCubit(gh<_i17.ISongRepository>()));
    gh.factory<_i29.UpdateAccountCubit>(
        () => _i29.UpdateAccountCubit(gh<_i13.IAuthFacade>()));
    gh.factory<_i30.AddSongCubit>(
        () => _i30.AddSongCubit(gh<_i15.IPlaylistRepository>()));
    gh.factory<_i31.AuthStatusBloc>(
        () => _i31.AuthStatusBloc(gh<_i13.IAuthFacade>()));
    gh.factory<_i32.CreatePlaylistCubit>(
        () => _i32.CreatePlaylistCubit(gh<_i15.IPlaylistRepository>()));
    gh.factory<_i33.DeletePlaylistCubit>(
        () => _i33.DeletePlaylistCubit(gh<_i15.IPlaylistRepository>()));
    gh.factory<_i34.EditPlaylistCubit>(
        () => _i34.EditPlaylistCubit(gh<_i15.IPlaylistRepository>()));
    gh.factory<_i35.GetArtistCubit>(
        () => _i35.GetArtistCubit(gh<_i11.IArtistRepository>()));
    gh.factory<_i36.HomeSongsCubit>(
        () => _i36.HomeSongsCubit(gh<_i17.ISongRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i37.InjectableModule {}
