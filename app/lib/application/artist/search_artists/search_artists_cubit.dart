import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/artist/artist.dart';
import 'package:horizon/domain/artist/artist_failure.dart';
import 'package:horizon/domain/artist/i_artist_repository.dart';
import 'package:injectable/injectable.dart';

part 'search_artists_state.dart';
part 'search_artists_cubit.freezed.dart';

@injectable
class SearchArtistsCubit extends Cubit<SearchArtistsState> {
  final IArtistRepository _repository;

  SearchArtistsCubit(this._repository)
      : super(const SearchArtistsState.initial());

  Future<void> getArtists(
    String query, {
    int? page,
    int? limit,
  }) async {
    emit(const SearchArtistsState.loadInProgress());
    final failureOrArtists = await _repository.searchArtists(
      query: query,
      page: page,
      limit: limit,
    );
    emit(
      failureOrArtists.fold(
        (f) => SearchArtistsState.loadFailure(f),
        (artists) => SearchArtistsState.loadSuccess(artists),
      ),
    );
  }

  void reset() => emit(const SearchArtistsState.loadSuccess([]));
}
