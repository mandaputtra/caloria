import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HttpSearchMeal {
  Future<List<dynamic>> getMealData(String query) async {
    try {
      String path =
          'https://fatsecret-unofc-api.vercel.app/api/id/search?query=$query';
      var url = Uri.parse(path);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        var items = jsonResponse['items'] as List<dynamic>;
        return items;
      }
      return [];
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return [];
    }
  }
}
