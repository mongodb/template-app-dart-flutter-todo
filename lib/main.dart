import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:flutter_todo/realm/app_services.dart';
import 'package:flutter_todo/realm/init_realm.dart';
import 'package:flutter_todo/screens/homepage.dart';
import 'package:flutter_todo/screens/log_in.dart';

void main() async {
  // get app id from config
  WidgetsFlutterBinding.ensureInitialized();
  final realmConfig =
      json.decode(await rootBundle.loadString('assets/config/realm.json'));
  String appId = realmConfig['appId'];
  Uri baseUrl = Uri.parse(realmConfig['baseUrl']);

  return runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AppServices>(
        create: (_) => AppServices(appId, baseUrl)),
    ProxyProvider<AppServices, Realm?>(
      update: (context, app, previousRealm) {
        if (app.currentUser != null) {
          previousRealm?.close();
          return initRealm(app.currentUser!);
        }
        return null;
      },
      dispose: (_, realm) => realm?.close(),
    )
  ], child: const App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser =
        Provider.of<AppServices>(context, listen: false).currentUser;
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        title: 'Realm Flutter Todo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: currentUser != null ? '/' : '/login',
        routes: {
          '/': (context) => const HomePage(),
          '/login': (context) => LogIn()
        },
      ),
    );
  }
}
