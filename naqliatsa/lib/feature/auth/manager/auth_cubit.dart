import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/helper/constant.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  int counter = 45;
  String phone = '';
  String smsCode = '';
  String _verifId = '';
  bool _isUserHasCollection = false;
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendOTP() async {
    if (state is AuthLoading) return;
    emit(AuthLoading());
    counter = 45; // ! Reset counter
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: counter),
        codeSent: (String verificationId, int? _) async {
          await _codeSent(verificationId);
          emit(CodeSentState());
        },
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _verificationCompleted(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            emit(AuthFailure("The provided phone number is not valid."));
          } else if (e.code == 'too-many-requests') {
            emit(AuthFailure("Too many requests. please try again later."));
          } else {
            emit(AuthFailure("Something went wrong."));
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      emit(AuthFailure("Unexpected error. Try again later."));
    }
  }

  Future<void> _verificationCompleted(PhoneAuthCredential credential) async {
    await _auth.signInWithCredential(credential);
    await saveUser();
    _isUserHasCollection = await _didUserCollectData;
    emit(AuthSuccess(_isUserHasCollection));
  }

  Future<void> _codeSent(String verificationId) async {
    _verifId = verificationId;
    await saveUser(); // ! Save user to firestore
  }

  Future<void> resendOTP() async {
    if (state is AuthLoading) return;
    emit(AuthLoading());
    counter = 45; // ! Reset counter
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: counter),
        codeSent: (String verificationId, int? _) async {
          await _codeSent(verificationId);
        },
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _verificationCompleted(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            emit(AuthFailure("The provided phone number is not valid."));
          } else if (e.code == 'too-many-requests') {
            emit(AuthFailure("Too many requests. please try again later."));
          } else {
            emit(AuthFailure("Something went wrong."));
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      emit(AuthFailure("Unexpected error. Try again later."));
    }
  }

  Future<void> verifyPhone() async {
    if (state is AuthLoading || smsCode.isEmpty) return;
    emit(AuthLoading());
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        smsCode: smsCode,
        verificationId: _verifId,
      );
      await _verificationCompleted(credential);
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
        emit(AuthFailure("Unexpected error. Try again later."));
      }
    }
  }

  Future<void> saveUser() async {
    try {
      if (_auth.currentUser == null) return;
      await _firestore
          .collection(DataString.usersCollection)
          .doc(_auth.currentUser!.uid)
          .set({
            'phone': _auth.currentUser!.phoneNumber,
            'last_login': FieldValue.serverTimestamp(),
          }, SetOptions(merge: true));
    } catch (e) {
      emit(AuthFailure("Oops! Couldn't save a user."));
    }
  }

  Future<bool> get _didUserCollectData async {
    try {
      final DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection(DataString.usersCollection)
          .doc(_auth.currentUser?.uid)
          .get();
      // check if user exists and has document
      if (doc.exists || doc.data() == null) return false;
      final data = doc.data() as Map<String, dynamic>;
      print(doc.exists);
      return data.containsKey(DataString.collectionAtt);
    } catch (e) {
      emit(AuthFailure("Oops! Couldn't get the data."));
      return false;
    }
  }
}
