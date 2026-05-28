import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  FlutterSecureStorage storage() => const FlutterSecureStorage();

  @lazySingleton
  Logger get logger => Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );
}
