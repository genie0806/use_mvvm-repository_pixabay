import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:try_image_search/model/saearch_model.dart';

class PixaBayApi {
  static const base_Url = 'https://pixabay.com/api/';

  Future<SearchModel> fetchSearchData(String searchKeyword) async {
    final response = await http.get(Uri.parse(
        '$base_Url?key=17828481-17c071c7f8eadf406822fada3&q=$searchKeyword&image_type=photo'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      SearchModel searchData = SearchModel.fromJson(jsonResponse);
      return searchData;
    }
    throw Exception('StatusCode is not 200');
  }
}
