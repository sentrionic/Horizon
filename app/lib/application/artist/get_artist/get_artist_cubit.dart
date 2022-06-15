import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/artist/artist.dart';
import 'package:horizon/domain/artist/artist_failure.dart';
import 'package:horizon/domain/artist/i_artist_repository.dart';
import 'package:injectable/injectable.dart';

part 'get_artist_state.dart';
part 'get_artist_cubit.freezed.dart';

@injectable
class GetArtistCubit extends Cubit<GetArtistState> {
  final IArtistRepository _repository;

  GetArtistCubit(this._repository) : super(const GetArtistState.initial());

  Future<void> getArtist(String id) async {
    emit(const GetArtistState.loadInProgress());
    final failureOrArtist = await _repository.getArtist(id: id);
    emit(
      failureOrArtist.fold(
        (f) => GetArtistState.loadFailure(f),
        (artist) => GetArtistState.loadSuccess(artist),
      ),
    );
  }
}
