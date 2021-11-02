import 'package:try_image_search/domain/repository/result.dart';
import 'package:try_image_search/domain/model/saearch_model.dart';

abstract class PhotoRepository {
  Future<Result<SearchModel>> getPhotos(String query);
}
