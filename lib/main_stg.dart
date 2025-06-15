import 'config/flavors.dart';
import 'main.dart' as runner;

Future<void> main() async {
  appFlavor = Flavor.stg;
  await runner.main();
}
