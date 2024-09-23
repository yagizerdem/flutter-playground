import 'package:app/class/expanse_types.dart';
import 'package:uuid/uuid.dart';

var uuid_ = const Uuid();

class Expanse {
  final double price;
  final Expansetypes expnaseType;
  final String uuid;
  final DateTime date;
  final String title;

  Expanse(
      {required this.price,
      required this.expnaseType,
      required this.date,
      required this.title})
      : uuid = uuid_.v4();
}
