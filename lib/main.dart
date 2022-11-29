import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_browser.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:projet/view/routing/router.gr.dart';
import 'utils/firebase_options.dart';

void main() async {
  await initIntlAndLocale();

  /*WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/

  runApp(const MyApp());
}

Future<void> initIntlAndLocale() async {
  Intl.defaultLocale = 'fr_FR';
  await findSystemLocale();
  await initializeDateFormatting(Intl.defaultLocale!, null);
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {

  const MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hearthstone cards',
      theme: ThemeData(
          primaryColor: Colors.brown
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
