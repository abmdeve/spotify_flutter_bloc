import 'package:dartz/dartz.dart';
import 'package:spotify_flutter_bloc/data/models/auth/create_user_request.dart';
import 'package:spotify_flutter_bloc/data/models/auth/sign_in_user_request.dart';

abstract class AuthRepository {
  Future<Either> signUp(CreateUserRequest createUserRequest);

  Future<Either> signIn(SignInUserRequest signInUserRequest);
}
