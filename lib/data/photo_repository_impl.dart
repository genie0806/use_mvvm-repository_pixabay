import 'package:http/http.dart' as http;
import 'package:try_image_search/data/result.dart';

import 'package:try_image_search/model/api_model.dart';
import 'package:try_image_search/data/repository.dart';
import 'package:try_image_search/model/saearch_model.dart';

class PixabayPhotoRepositoryImpl implements PhotoRepository {
  PixaBayApi api;

  PixabayPhotoRepositoryImpl(
    this.api,
  );

  @override
  Future<Result<SearchModel>> getPhotos(String query) async {
    return api.fetchSearchData(query);
  }
}
