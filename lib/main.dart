import 'package:bank_off_time/core/utils/constants.dart';
import 'package:bank_off_time/features/splash/presentaion/view/splash_view.dart';
import 'package:bank_off_time/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(255, 234, 244, 1.0),
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
    return MaterialApp(
      title: 'Bank Off Time',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: const Color.fromRGBO(70, 150, 115, 1),
          seedColor: const Color.fromRGBO(70, 150, 115, 1),
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(255, 234, 244, 1.0),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: notifier.locale,
      navigatorKey: Constants.navigatorKey,
      home: const SplashView(),
    );
  }
}
