import 'constant.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../feature/home/ui/view/home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../feature/auth/ui/view/onboarding_view.dart';
import '../../feature/collection/ui/view/collection_view.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, authSnapshot) {
        // 1. حالة التحميل الأساسية (Firebase Auth)
        if (authSnapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold();
        }

        // 2. إذا لم يسجل دخول، يذهب للأونبوردنج
        if (authSnapshot.data == null) return const OnboardingView();

        // 3. إذا سجل دخول بالهاتف، نتحقق الآن من بياناته في Firestore
        return FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection(DataString.usersCollection)
              .doc(authSnapshot.data!.uid)
              .get(),
          builder: (context, dbSnapshot) {
            // حالة انتظار جلب البيانات من الداتابيز
            if (dbSnapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold();
            }

            // التحقق هل البيانات (collectionAtt) موجودة؟
            final bool hasData =
                dbSnapshot.data != null &&
                dbSnapshot.data!.exists &&
                (dbSnapshot.data!.data() as Map<String, dynamic>).containsKey(
                  DataString.collectionAtt,
                );

            if (hasData) {
              return const HomeView(); // البيانات كاملة -> الهوم
            } else {
              return const CollectionView(); // البيانات ناقصة -> صفحة إدخال البيانات
            }
          },
        );
      },
    );
  }
}
