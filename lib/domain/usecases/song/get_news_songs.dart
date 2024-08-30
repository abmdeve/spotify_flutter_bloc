import 'package:dartz/dartz.dart';
import 'package:spotify_flutter_bloc/core/usecase/usecase.dart';
import 'package:spotify_flutter_bloc/data/repository/song/song_repository_impl.dart';

import '../../../service_locator.dart';

class GetNewsSongUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    // TODO: implement call
    return await sl<SongRepositoryImpl>().getNewsSongs();
  }
}
