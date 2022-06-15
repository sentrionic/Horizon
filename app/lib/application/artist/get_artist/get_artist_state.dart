part of 'get_artist_cubit.dart';

@freezed
class GetArtistState with _$GetArtistState {
  const factory GetArtistState.initial() = _Initial;
  const factory GetArtistState.loadInProgress() = _LoadInProgress;

  const factory GetArtistState.loadSuccess(Artist artist) = _LoadSuccess;
  const factory GetArtistState.loadFailure(ArtistFailure failure) =
      _LoadFailure;
}
