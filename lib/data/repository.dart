import 'package:try_image_search/data/result.dart';
import 'package:try_image_search/model/saearch_model.dart';

abstract class PhotoRepository {
  Future<Result<SearchModel>> getPhotos(String query);
}
