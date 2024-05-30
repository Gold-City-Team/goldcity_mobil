import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/data/local_manager.dart';
import 'package:goldcity/config/data/shared_manager.dart';
import 'package:goldcity/config/language/language_manager.dart';
import 'package:goldcity/config/navigation/navigation_route.dart';
import 'package:goldcity/config/navigation/navigation_service.dart';
import 'package:goldcity/config/notifier/provider_list.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/general_constant.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:goldcity/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await EasyLocalization.ensureInitialized();
  locator<SharedManager>();

  await Hive.initFlutter();
  locator<LocalManager>().init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      try {
        LanguageManager.instance.context = context;
      } catch (_) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoldCity',
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
