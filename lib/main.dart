import 'package:flutter/material.dart';
import 'package:goldcity/config/notifier/provider_list.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifier>().currentTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: locator.get<NavigationRoute>().generateRoute,
      navigatorKey: locator.get<NavigationService>().navigatorKey,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
