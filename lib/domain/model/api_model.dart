import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:try_image_search/domain/repository/result.dart';
import 'package:try_image_search/domain/model/saearch_model.dart';

class PixaBayApi {
  static const baseUrl = 'https://pixabay.com/api/';

  Future<Result<SearchModel>> fetchSearchData(String searchKeyword) async {
    try {
      final response = await http.get(Uri.parse(
          '$baseUrl?key=17828481-17c071c7f8eadf406822fada3&q=$searchKeyword&image_type=photo'));
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      SearchModel searchData = SearchModel.fromJson(jsonResponse);
      return Result.success(searchData);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
