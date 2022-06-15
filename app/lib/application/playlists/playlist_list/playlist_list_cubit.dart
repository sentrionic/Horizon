import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/playlists/i_playlist_repository.dart';
import 'package:horizon/domain/playlists/playlist.dart';
import 'package:horizon/domain/playlists/playlist_failure.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'playlist_list_cubit.freezed.dart';
part 'playlist_list_state.dart';

@injectable
class PlaylistListCubit extends HydratedCubit<PlaylistListState> {
  final IPlaylistRepository _repository;

  PlaylistListCubit(
    this._repository,
  ) : super(const PlaylistListState.initial());

  Future<void> getPlaylists() async {
    emit(const PlaylistListState.loadInProgress());
    final failureOrPlaylists = await _repository.getPlaylists();
    emit(
      failureOrPlaylists.fold(
        (f) => PlaylistListState.loadFailure(f),
        (playlists) => PlaylistListState.loadSuccess(playlists),
      ),
    );
  }

  void addPlaylist(Playlist playlist) {
    state.maybeWhen(
      loadSuccess: (playlists) => emit(
        PlaylistListState.loadSuccess([playlist, ...playlists]),
      ),
      orElse: () {},
    );
  }

  void updatePlaylist(Playlist playlist) {
    state.maybeWhen(
      loadSuccess: (playlists) {
        final data =
            playlists.map((p) => p.id == playlist.id ? playlist : p).toList();
        emit(PlaylistListState.loadSuccess(data));
      },
      orElse: () {},
    );
  }

  void removePlaylist(Playlist playlist) {
    state.maybeWhen(
      loadSuccess: (playlists) {
        final data = playlists.where((p) => p.id != playlist.id).toList();
        emit(PlaylistListState.loadSuccess(data));
      },
      orElse: () {},
    );
  }

  Playlist? getPlaylist(String id) {
    return state.maybeWhen(
      loadSuccess: (playlists) =>
          playlists.where((e) => e.id == id).firstOrNull,
      orElse: () => null,
    );
  }

  @override
  PlaylistListState? fromJson(Map<String, dynamic> json) {
    final jsonMap = json['playlists'] as List<dynamic>;
    final list = jsonMap
        .map(
          (e) => Playlist(
            id: e["id"],
            name: e["name"],
            owner: e["owner"],
            duration: e["duration"],
            songCount: e["songCount"],
            description: e["description"],
          ),
        )
        .toList();
    return PlaylistListState.loadSuccess(list);
  }

  @override
  Map<String, dynamic>? toJson(PlaylistListState state) {
    return state.maybeWhen(
      loadSuccess: (playlists) => {
        'playlists': playlists
            .map(
              (e) => {
                "id": e.id,
                "name": e.name,
                "description": e.description,
                "owner": e.owner,
                "duration": e.duration,
                "songCount": e.songCount,
              },
            )
            .toList()
      },
      orElse: () => null,
    );
  }
}
