import 'package:flutter_flavor/flutter_flavor.dart';

import 'modules/core/utils/core_import.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    variables: {
      "env": "production",
      "color_default": Colors.yellow,
      "color_other": Colors.black,
    },
  );
  runApp(const MyApp());
}
