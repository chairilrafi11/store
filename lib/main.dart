import 'package:chairil/data/database/location_box.dart';
import 'package:chairil/data/database/store_box.dart';
import 'package:chairil/ui/splashscreen/view/splashscreen_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:chairil/core/util/core_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';

import 'core/app/app.dart';
import 'ui/counter_observer.dart';

Future<void> main() async {
  await init();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle( 
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    BlocOverrides.runZoned(
      () => runApp(const MyApp()),
      blocObserver: CounterObserver(),
    );
  // });
}

Future<void> init() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  //? Set Hive Database
  var appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.initFlutter(appDocumentDirectory.path);
  Hive.registerAdapter(StoreBoxAdapter());
  Hive.registerAdapter(LocationBoxAdapter());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    _setupLogging();
    super.initState();
  }

  void _setupLogging() async {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((rec) {
      CoreFunction.logPrint("", '${rec.level.name}: ${rec.time}; ${rec.message}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chairil',
      navigatorKey: navGK,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: Constant.avenirRegular,
      ),
      home: const SplashscreenView()
    );
  }
}