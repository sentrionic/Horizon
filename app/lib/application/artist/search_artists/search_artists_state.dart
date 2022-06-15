part of 'search_artists_cubit.dart';

@freezed
class SearchArtistsState with _$SearchArtistsState {
  const factory SearchArtistsState.initial() = _Initial;
  const factory SearchArtistsState.loadInProgress() = _LoadInProgress;

  const factory SearchArtistsState.loadSuccess(List<Artist> artists) =
      _LoadSuccess;
  const factory SearchArtistsState.loadFailure(ArtistFailure failure) =
      _LoadFailure;
}
