import 'package:dartz/dartz.dart';
import 'package:spotify_flutter_bloc/core/usecase/usecase.dart';
import 'package:spotify_flutter_bloc/data/models/auth/sign_in_user_request.dart';
import 'package:spotify_flutter_bloc/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SignInUseCase implements UseCase<Either, SignInUserRequest> {
  @override
  Future<Either> call({SignInUserRequest? params}) {
    // TODO: implement call
    return sl<AuthRepository>().signIn(params!);
  }
}
