import 'package:logger/logger.dart';

const String kAppTag = 'APP_TAG';

final Logger logger = Logger(
  printer: PrefixPrinter(PrettyPrinter(), prefix: kAppTag),
);
