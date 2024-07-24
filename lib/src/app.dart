import 'package:flutter/material.dart';
import 'launcher.dart';
import 'details_view.dart';
import 'list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          debugShowCheckedModeBanner: false,
          initialRoute: LaucherView.routeName,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case MatakuliahDetailsView.routeName:
                    return MatakuliahDetailsView();
                  case MatakuliahListView.routeName:
                    return const MatakuliahListView();
                  case LaucherView.routeName:
                    return const LaucherView();
                  default:
                    return const LaucherView();
                }
              },
            );
          },
        );
      },
    );
  }
}
