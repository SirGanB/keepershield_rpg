import 'package:keepershield_rpg/objectbox.g.dart';

class ObjectBox {
  static late final Store store;

  static Future<void> init() async {
    store = await openStore();
  }
}
