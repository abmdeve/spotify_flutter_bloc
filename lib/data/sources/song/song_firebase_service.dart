import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_flutter_bloc/data/models/song/song_model.dart';
import 'package:spotify_flutter_bloc/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();
}

class SongFirebaseServiceImpl implements SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    // TODO: implement getNewsSongs
    try{
    List<SongEntity> songs = [];
    var data = await FirebaseFirestore.instance
        .collection('Songs')
        .orderBy('releaseDate', descending: true)
        .limit(3)
        .get();

    for (var element in data.docs) {
      var songModel = SongModel.fromJson(element.data());
      songs.add(songModel.toEntity());
    }
    return Right(songs);
    }catch(e){
      return const Left("AN ERROR OCCURRED, PLEASE TRY AGAIN.");
    }

  }
}
