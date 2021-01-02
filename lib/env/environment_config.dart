import 'package:flutter_riverpod/flutter_riverpod.dart';

// Haven't use it: For future use case
class EnvironmentConfig {
// We add the api key by running 'flutter run --dart-define=movieApiKey=MYKEY
  final demoApiKey = const String.fromEnvironment("demoApiKey");
}

final environmentConfigProvider = Provider<EnvironmentConfig>((ref) {
  return EnvironmentConfig();
});
