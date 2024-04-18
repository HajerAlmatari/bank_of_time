import 'package:bank_off_time/core/providers/session_provider.dart';
import 'package:bank_off_time/core/utils/constants.dart';
import 'package:bank_off_time/features/splash/presentaion/view/splash_view.dart';
import 'package:bank_off_time/firebase_options.dart';
import 'package:bank_off_time/main_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark
      )
  );


  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(mainProvider);
    ref.watch(sessionProvider);
    return MaterialApp(
      title: 'Bank Off Time',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: const Color.fromRGBO(70, 150, 115, 1),
          seedColor: const Color.fromRGBO(70, 150, 115, 1),
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: notifier.locale,
      navigatorKey: Constants.navigatorKey,
      home: const SplashView(),
      //hello t_b
    );
  }
}
