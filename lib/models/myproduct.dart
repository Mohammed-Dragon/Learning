import 'package:isar/isar.dart';

part 'myproduct.g.dart';

@Collection()
class Myproduct {
  Id id = Isar.autoIncrement;
  late String name;
  late double price;
  late String description;
  late String image;
}
