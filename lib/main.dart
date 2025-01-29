import 'package:flutter/material.dart';
import 'package:kawika_machinetest/app/modules/home/view/home_page.dart';
import 'package:kawika_machinetest/utils/preference.dart';
import 'package:provider/provider.dart';

import 'app/modules/home/view_model/provider.dart';
import 'app/modules/login/view/login_page.dart';
import 'app/modules/login/view_model/bottom_navigation.dart';
import 'app/modules/login/view_model/login_provider.dart';
import 'utils/responsive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LoginProvider()),
          ChangeNotifierProvider(create: (context) => HomeProvider()),
          ChangeNotifierProvider(create: (context) => BottomNavigationBarProvider()),
        ],
        builder: (context, child) {
          return LayoutBuilder(builder: (context, Constraints) {
            return OrientationBuilder(builder: (context, Orientation) {
              Responsive().init(Constraints, Orientation);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: AppPref.isSignedIn == true ? HomePage() : LoginPage(),
              );
            });
          });
        });
  }
}
