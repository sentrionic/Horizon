// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:grpc/grpc.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import 'application/artist/get_artist/get_artist_cubit.dart' as _i35;
import 'application/artist/search_artists/search_artists_cubit.dart' as _i26;
import 'application/audio_player/audio_player_cubit.dart' as _i4;
import 'application/auth/account/account_cubit.dart' as _i3;
import 'application/auth/auth_status/auth_status_bloc.dart' as _i31;
import 'application/auth/login_form/login_form_cubit.dart' as _i21;
import 'application/auth/register_form/register_form_cubit.dart' as _i24;
import 'application/auth/update_account/update_account_cubit.dart' as _i29;
import 'application/playlists/add_song/add_song_cubit.dart' as _i30;
import 'application/playlists/create_playlist/create_playlist_cubit.dart'
    as _i32;
import 'application/playlists/delete_playlist/delete_playlist_cubit.dart'
    as _i33;
import 'application/playlists/edit_playlist/edit_playlist_cubit.dart' as _i34;
import 'application/playlists/playlist_list/playlist_list_cubit.dart' as _i22;
import 'application/playlists/playlist_songs/playlist_songs_cubit.dart' as _i23;
import 'application/playlists/remove_song/remove_song_cubit.dart' as _i25;
import 'application/songs/home_songs/home_songs_cubit.dart' as _i36;
import 'application/songs/increment_playcount/increment_playcount_cubit.dart'
    as _i19;
import 'application/songs/liked_songs/liked_songs_cubit.dart' as _i20;
import 'application/songs/song_list/song_list_cubit.dart' as _i27;
import 'application/songs/toggle_like/toggle_like_cubit.dart' as _i28;
import 'domain/artist/i_artist_repository.dart' as _i11;
import 'domain/auth/i_auth_facade.dart' as _i13;
import 'domain/playlists/i_playlist_repository.dart' as _i15;
import 'domain/songs/i_song_repository.dart' as _i17;
import 'infrastructure/artist/artist_repository.dart' as _i12;
import 'infrastructure/auth/auth_facade.dart' as _i14;
import 'infrastructure/core/injectable_module.dart' as _i37;
import 'infrastructure/playlists/playlist_repository.dart' as _i16;
import 'infrastructure/proto/artist_service.pbgrpc.dart' as _i9;
import 'infrastructure/proto/auth_service.pbgrpc.dart' as _i10;
import 'infrastructure/proto/playlist_service.pbgrpc.dart' as _i7;
import 'infrastructure/proto/song_service.pbgrpc.dart' as _i8;
import 'infrastructure/songs/song_repository.dart'
    as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.factory<_i3.AccountCubit>(() => _i3.AccountCubit());
  gh.factory<_i4.AudioPlayerCubit>(() => _i4.AudioPlayerCubit());
  await gh.lazySingletonAsync<_i5.ClientChannel>(() => injectableModule.channel,
      preResolve: true);
  gh.lazySingleton<_i6.FlutterSecureStorage>(() => injectableModule.storage());
  gh.lazySingleton<_i7.PlaylistClient>(
      () => injectableModule.playlistClient(get<_i5.ClientChannel>()));
  gh.lazySingleton<_i8.SongClient>(
      () => injectableModule.songClient(get<_i5.ClientChannel>()));
  gh.factory<String>(() => injectableModule.baseUrl, instanceName: 'BaseUrl');
  gh.factory<String>(() => injectableModule.authority,
      instanceName: 'Authority');
  gh.factory<int>(() => injectableModule.port, instanceName: 'Port');
  gh.lazySingleton<_i9.ArtistClient>(
      () => injectableModule.artistClient(get<_i5.ClientChannel>()));
  gh.lazySingleton<_i10.AuthClient>(
      () => injectableModule.authClient(get<_i5.ClientChannel>()));
  gh.lazySingleton<_i11.IArtistRepository>(() => _i12.ArtistRepository(
      get<_i9.ArtistClient>(), get<_i6.FlutterSecureStorage>()));
  gh.lazySingleton<_i13.IAuthFacade>(() =>
      _i14.AuthFacade(get<_i10.AuthClient>(), get<_i6.FlutterSecureStorage>()));
  gh.lazySingleton<_i15.IPlaylistRepository>(() => _i16.PlaylistRepository(
      get<_i7.PlaylistClient>(), get<_i6.FlutterSecureStorage>()));
  gh.lazySingleton<_i17.ISongRepository>(() => _i18.SongRepository(
      get<_i8.SongClient>(), get<_i6.FlutterSecureStorage>()));
  gh.factory<_i19.IncrementPlaycountCubit>(
      () => _i19.IncrementPlaycountCubit(get<_i17.ISongRepository>()));
  gh.factory<_i20.LikedSongsCubit>(
      () => _i20.LikedSongsCubit(get<_i17.ISongRepository>()));
  gh.factory<_i21.LoginFormCubit>(
      () => _i21.LoginFormCubit(get<_i13.IAuthFacade>()));
  gh.factory<_i22.PlaylistListCubit>(
      () => _i22.PlaylistListCubit(get<_i15.IPlaylistRepository>()));
  gh.factory<_i23.PlaylistSongsCubit>(
      () => _i23.PlaylistSongsCubit(get<_i15.IPlaylistRepository>()));
  gh.factory<_i24.RegisterFormCubit>(
      () => _i24.RegisterFormCubit(get<_i13.IAuthFacade>()));
  gh.factory<_i25.RemoveSongCubit>(
      () => _i25.RemoveSongCubit(get<_i15.IPlaylistRepository>()));
  gh.factory<_i26.SearchArtistsCubit>(
      () => _i26.SearchArtistsCubit(get<_i11.IArtistRepository>()));
  gh.factory<_i27.SongListCubit>(
      () => _i27.SongListCubit(get<_i17.ISongRepository>()));
  gh.factory<_i28.ToggleLikeCubit>(
      () => _i28.ToggleLikeCubit(get<_i17.ISongRepository>()));
  gh.factory<_i29.UpdateAccountCubit>(
      () => _i29.UpdateAccountCubit(get<_i13.IAuthFacade>()));
  gh.factory<_i30.AddSongCubit>(
      () => _i30.AddSongCubit(get<_i15.IPlaylistRepository>()));
  gh.factory<_i31.AuthStatusBloc>(
      () => _i31.AuthStatusBloc(get<_i13.IAuthFacade>()));
  gh.factory<_i32.CreatePlaylistCubit>(
      () => _i32.CreatePlaylistCubit(get<_i15.IPlaylistRepository>()));
  gh.factory<_i33.DeletePlaylistCubit>(
      () => _i33.DeletePlaylistCubit(get<_i15.IPlaylistRepository>()));
  gh.factory<_i34.EditPlaylistCubit>(
      () => _i34.EditPlaylistCubit(get<_i15.IPlaylistRepository>()));
  gh.factory<_i35.GetArtistCubit>(
      () => _i35.GetArtistCubit(get<_i11.IArtistRepository>()));
  gh.factory<_i36.HomeSongsCubit>(
      () => _i36.HomeSongsCubit(get<_i17.ISongRepository>()));
  return get;
}

class _$InjectableModule extends _i37.InjectableModule {}
