
import 'package:dartz/dartz.dart';
import 'package:spotify_flutter_bloc/core/usecase/usecase.dart';
import 'package:spotify_flutter_bloc/data/models/auth/create_user_request.dart';
import 'package:spotify_flutter_bloc/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SignUpUseCase implements UseCase<Either, CreateUserRequest> {
  @override
  Future<Either> call({CreateUserRequest ? params}) async{
    // TODO: implement call
    return sl<AuthRepository>().signUp(params!);
  }

}