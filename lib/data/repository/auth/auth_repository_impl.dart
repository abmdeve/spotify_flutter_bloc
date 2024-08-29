import 'package:dartz/dartz.dart';
import 'package:spotify_flutter_bloc/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_flutter_bloc/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';
import '../../models/auth/create_user_request.dart';
import '../../models/auth/sign_in_user_request.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SignInUserRequest signInUserRequest) async{
    // TODO: implement signIn
    return await sl<AuthFirebaseService>().signIn(signInUserRequest);

  }

  @override
  Future<Either> signUp(CreateUserRequest createUserRequest) async {
    // TODO: implement signUp
    return await sl<AuthFirebaseService>().signUp(createUserRequest);
  }
}
