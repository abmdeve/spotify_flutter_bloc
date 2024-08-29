import 'package:get_it/get_it.dart';
import 'package:spotify_flutter_bloc/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_flutter_bloc/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_flutter_bloc/domain/repository/auth/auth.dart';
import 'package:spotify_flutter_bloc/domain/usecases/auth/sign_in.dart';
import 'package:spotify_flutter_bloc/domain/usecases/auth/sign_up.dart';

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
}
