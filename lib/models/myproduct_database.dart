import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:learn/models/myproduct.dart';
import 'package:path_provider/path_provider.dart';

class MyproductDatabase extends ChangeNotifier {
  static late Isar isar;
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [MyproductSchema],
      directory: dir.path,
    );
  }

  final List<Myproduct> currentProducts = [];
  Future<void> addToCart(Myproduct item) async {
    final Name = Myproduct()..name = item.name;
    final Price = Myproduct()..price = item.price;
    final Description = Myproduct()..description = item.description;
    final Image = Myproduct()..image = item.image;
    await isar.writeTxn(() => isar.myproducts.put(Name));
    await isar.writeTxn(() => isar.myproducts.put(Price));
    await isar.writeTxn(() => isar.myproducts.put(Description));
    await isar.writeTxn(() => isar.myproducts.put(Image));
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    List<Myproduct> fetchedProducts = await isar.myproducts.where().findAll();
    currentProducts.clear();
    currentProducts.addAll(fetchedProducts);
    notifyListeners();
  }

  Future<void> UpdateProduct(int id, String Name, double Price,
      String Description, String Image) async {
    final existingproduct = await isar.myproducts.get(id);
    if (existingproduct != null) {
      existingproduct.name = Name;
      existingproduct.price = Price;
      existingproduct.description = Description;
      existingproduct.image = Image;
      await isar.writeTxn(() => isar.myproducts.put(existingproduct));
      await fetchProducts();
    }
  }

  Future<void> DeleteProduct(int id) async {
    await isar.writeTxn(() => isar.myproducts.delete(id));
    await fetchProducts();
  }
}
