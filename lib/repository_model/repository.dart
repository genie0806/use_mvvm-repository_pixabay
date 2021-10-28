import 'package:try_image_search/repository_model/saearch_model.dart';

abstract class photoRepository {
  Future<SearchModel> getPhotos(String query);
}
