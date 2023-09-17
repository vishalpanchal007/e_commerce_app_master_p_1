
import 'dart:convert';
import 'package:e_commerce_app/Model/fakestore.dart';
import 'package:http/http.dart' as http;

class FakeStoreApiHelper {
  FakeStoreApiHelper._();
  static final FakeStoreApiHelper currencyApiHelper = FakeStoreApiHelper._();

  String api = "https://fakestoreapi.com/products";

  Future fetchFakeStoreData() async {
    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      List decodeData = jsonDecode(res.body);

      List<FakeStore> fakeData =
      decodeData.map((e) => FakeStore.fromMap(e)).toList();

      return fakeData;
    }
  }
}
