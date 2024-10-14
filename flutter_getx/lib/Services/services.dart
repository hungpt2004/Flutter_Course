import '../Model/itesm_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static Future<List<Product>?> fetchProducts() async {
    var response =
        await client.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      var json = response.body;
      print(json.length);
      return productFromJson(json);
    } else {
      print('Error response:${response.body}');
    }

    return null;
  }
}
