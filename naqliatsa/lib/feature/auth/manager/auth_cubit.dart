import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  int counter = 60;
  String phone = '';
  String smsCode = '';
  String _verifId = '';
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendOTP() async {
    if (state is AuthLoading) return;
    emit(AuthLoading());
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: counter),
        codeSent: (String verificationId, int? _) async {
          _verifId = verificationId;
          emit(CodeSentState());
        },
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          emit(AuthSuccess());
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            emit(AuthFailure("The provided phone number is not valid."));
          } else if (e.code == 'too-many-requests') {
          } else {
            emit(AuthFailure("Something went wrong."));
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          emit(AuthFailure("Timeout. please try again."));
          // _verifId = verificationId;
        },
      );
    } catch (e) {
      emit(AuthFailure("Something went wrong. Try again later."));
    }
  }

  Future<void> verifyPhone() async {
    if (state is AuthLoading) return;
    emit(AuthLoading());
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        smsCode: smsCode,
        verificationId: _verifId,
      );
      await _auth.signInWithCredential(credential);
      emit(AuthSuccess());
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-verification-code') {
          emit(AuthFailure("The provided code is not valid."));
        } else if (e.code == 'session-expired') {
          emit(AuthFailure("The provided code is expired."));
        } else if (e.code == 'invalid-verification-id') {
          emit(AuthFailure("The provided code is invalid."));
        } else {
          emit(AuthFailure("Something went wrong. Status code $e"));
        }
      } else {
        emit(AuthFailure("Something went wrong. Try again later."));
      }
    }
  }
}
