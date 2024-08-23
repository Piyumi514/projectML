import 'package:ayurcare/pages/connecting_page.dart';
import 'package:ayurcare/pages/submit_page.dart';
import 'package:ayurcare/util/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (defaultTargetPlatform != TargetPlatform.windows) {
    // window currently don't support storage emulator
    final emulatorHost =
    (!kIsWeb && defaultTargetPlatform == TargetPlatform.android)
        ? '10.0.2.2'
        : 'localhost';

    await FirebaseStorage.instance.useStorageEmulator(emulatorHost, 9199);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  FutureBuilder<User?>(
        future: AuthService().getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data != null) {
            // User is signed in
            return MyPage();
          } else {
            // No user is signed in
            return ConnectingPage();
          }
        },
      ),
    );
  }
}
