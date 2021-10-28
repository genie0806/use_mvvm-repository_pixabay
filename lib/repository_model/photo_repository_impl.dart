import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:try_image_search/repository_model/repository.dart';
import 'package:try_image_search/repository_model/saearch_model.dart';

class PixabayPhotoRepositoryImpl implements photoRepository {
  static const baseUrl = 'https://pixabay.com/api/';

  @override
  Future<SearchModel> getPhotos(String query) async {
    final response = await http.get(Uri.parse(
        '$baseUrl?key=17828481-17c071c7f8eadf406822fada3&q=$query&image_type=photo'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    SearchModel searchData = SearchModel.fromJson(jsonResponse);
    return searchData;
  }
}
