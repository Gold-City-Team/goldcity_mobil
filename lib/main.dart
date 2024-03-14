import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goldcity/config/language/language_manager.dart';
import 'package:goldcity/config/navigation/navigation_route.dart';
import 'package:goldcity/config/navigation/navigation_service.dart';
import 'package:goldcity/config/notifier/provider_list.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:goldcity/util/constant/general_constant.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: GeneralConstant.LANG_ASSET_PATH,
      supportedLocales: LanguageManager.instance.supportedLocale,
      fallbackLocale: const Locale("en", "US"),
      child: MultiProvider(
        providers: [...ApplicationProvider.instance.dependItems],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gold City',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: context.watch<ThemeNotifier>().currentTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
