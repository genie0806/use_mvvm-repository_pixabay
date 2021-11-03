import 'package:http/http.dart' as http;
import 'package:try_image_search/domain/repository/result.dart';

import 'package:try_image_search/domain/model/api_model.dart';
import 'package:try_image_search/domain/repository/repository.dart';
import 'package:try_image_search/domain/model/saearch_model.dart';

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
