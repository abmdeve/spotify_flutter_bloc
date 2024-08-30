import 'package:get_it/get_it.dart';
import 'package:spotify_flutter_bloc/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_flutter_bloc/data/repository/song/song_repository_impl.dart';
import 'package:spotify_flutter_bloc/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_flutter_bloc/data/sources/song/song_firebase_service.dart';
import 'package:spotify_flutter_bloc/domain/repository/auth/auth.dart';
import 'package:spotify_flutter_bloc/domain/repository/song/song.dart';
import 'package:spotify_flutter_bloc/domain/usecases/auth/sign_in.dart';
import 'package:spotify_flutter_bloc/domain/usecases/auth/sign_up.dart';
import 'package:spotify_flutter_bloc/domain/usecases/song/get_news_songs.dart';

final sl = GetIt.instance;

Future<void> initializedDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  sl.registerSingleton<SignUpUseCase>(
    SignUpUseCase(),
  );

  sl.registerSingleton<SignInUseCase>(
    SignInUseCase(),
  );

  sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl(),
  );

  sl.registerSingleton<SongRepository>(
    SongRepositoryImpl(),
  );

  sl.registerSingleton<GetNewsSongUseCase>(
    GetNewsSongUseCase(),
  );
}
