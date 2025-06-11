import 'package:logger/logger.dart';

/// Printer that prefixes every log line with [tag]. This allows filtering logs
/// in tools like logcat.
class TagPrinter extends LogPrinter {
  TagPrinter(this.tag);

  final String tag;

  final PrettyPrinter _delegate = PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 120,
    colors: true,
    printEmojis: false,
    printTime: false,
  );

  @override
  List<String> log(LogEvent event) {
    return _delegate.log(event).map((line) => '$tag $line').toList();
  }
}

/// Tag used for filtering logs. Search for this value in logcat.
const String kAppTag = 'com.flutter.app';

/// Global logger instance that prefixes all messages with [kAppTag].
final Logger logger = Logger(printer: TagPrinter(kAppTag));
