import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:keepershield_rpg/app/views/my_app.dart';
import 'package:keepershield_rpg/repository/_lib_repository.dart';
import 'package:keepershield_rpg/services/auth.service.dart';
import 'package:provider/provider.dart';
import 'database/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthService()),
      ChangeNotifierProxyProvider<AuthService, TablesRepository>(
        create: (context) => TablesRepository(
          auth: context.read<AuthService>(),
        ),
        update: (_, authService, previousRepository) {
          return TablesRepository(auth: authService);
        },
      ),
      ChangeNotifierProxyProvider<AuthService, CharactersRepository>(
        create: (context) => CharactersRepository(
          auth: context.read<AuthService>(),
        ),
        update: (_, authService, previousRepository) {
          return CharactersRepository(auth: authService);
        },
      ),
    ],
    child: const MyApp(),
  ));
}
