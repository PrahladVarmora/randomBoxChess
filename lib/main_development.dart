import 'package:flutter_flavor/flutter_flavor.dart';

import 'modules/core/utils/core_import.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    variables: {
      "env": "development",
      "color_default": Colors.green,
      "color_other": Colors.red,
    },
  );
  runApp(const MyApp());
}
