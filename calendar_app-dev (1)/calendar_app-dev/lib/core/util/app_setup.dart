import 'dart:io';

import 'package:calendar_app/injection_container.dart' as di;

abstract class AppSetup {
  static Future<void> setup() async {
    HttpOverrides.global = MyHttpOverrides();
    await di.init();
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
