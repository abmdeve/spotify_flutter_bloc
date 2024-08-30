import 'package:dartz/dartz.dart';
import 'package:spotify_flutter_bloc/data/sources/song/song_firebase_service.dart';
import 'package:spotify_flutter_bloc/domain/repository/song/song.dart';

import '../../../service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewsSongs() async {
    // TODO: implement getNewsSongs
    return await sl<SongFirebaseService>().getNewsSongs();
  }
}
