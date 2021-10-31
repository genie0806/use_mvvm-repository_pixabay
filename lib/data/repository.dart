import 'package:try_image_search/model/saearch_model.dart';

abstract class PhotoRepository {
  Future<SearchModel> getPhotos(String query);
}
