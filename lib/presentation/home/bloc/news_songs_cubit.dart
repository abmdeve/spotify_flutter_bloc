import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_flutter_bloc/domain/usecases/song/get_news_songs.dart';

import '../../../service_locator.dart';
import 'news_songs_state.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewsSongUseCase>().call();

    returnedSongs.fold((l) {
      emit(NewsSongsLoadFailure());
    }, (data) {
      emit(NewsSongsLoaded(songs: data));
    });
  }
}
