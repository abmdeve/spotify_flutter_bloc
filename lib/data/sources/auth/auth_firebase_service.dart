import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_flutter_bloc/data/models/auth/create_user_request.dart';
import 'package:spotify_flutter_bloc/data/models/auth/sign_in_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserRequest createUserRequest);

  Future<Either> signIn(SignInUserRequest signInUserRequest);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signIn(SignInUserRequest signInUserRequest) async {
    // TODO: implement signIn

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInUserRequest.email,
        password: signInUserRequest.password,
      );

      return const Right('SIGN WAS SUCCESSFUL');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'EMAIL USER FOUND FOR THAT EMAIL';
      } else if (e.code == 'invalid-credential') {
        message = 'WRONG PASSWORD PROVIDED FOR THAT USER';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signUp(CreateUserRequest createUserRequest) async {
    // TODO: implement signUp
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserRequest.email,
        password: createUserRequest.password,
      );

      FirebaseFirestore.instance.collection('Users').add({
        'name': createUserRequest.fullName,
        ///'name': data.user!.displayName,
        'email': data.user!.email,
      });
      return const Right('SIGN UP WAS SUCCESSFUL');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'THE PASSWORD PROVIDED IS TOO WEAK';
      } else if (e.code == 'email-already-in-use') {
        message = 'AN ACCOUNT ALREADY EXISTS WITH THAT EMAIL';
      }

      return Left(message);
    }
  }
}
