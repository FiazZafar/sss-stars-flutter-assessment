import 'package:sss_stars_flutter_assessment/dataLayer/services/firebase_service.dart';
import 'package:sss_stars_flutter_assessment/dataLayer/network_response.dart/network_reponces.dart';
import '../mvvm/models/product_model.dart';

class ProductRepo {
  ProductRepo._();
  static final ProductRepo instance = ProductRepo._();

  final FirebaseService _firebaseService = FirebaseService();

  Future<ApiResponces<List<ProductItem>>> fetchProducts() async {
    try {
      final List<Map<String, dynamic>> data = await _firebaseService.fetchProducts();
      final productList = data.map((e) => ProductItem.fromJson(e)).toList();

      return ApiResponces.success(productList);
    } catch (e) {
      return ApiResponces.error("Firebase error: ${e.toString()}");
    }
  }
}