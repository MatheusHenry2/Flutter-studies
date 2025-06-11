import 'package:logger/logger.dart';

const String kAppTag = 'APP_TAG';

final Logger logger = Logger(
  // PrefixPrinter expects the prefix first, then the underlying printer
  printer: PrefixPrinter(
    kAppTag,
    PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 120,
      colors: true,
      printEmojis: false,
      printTime: false,
    ),
  ),
);
