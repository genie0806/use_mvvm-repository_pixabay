import 'package:flutter/cupertino.dart';
import 'package:try_image_search/repository_model/repository.dart';
import 'package:try_image_search/repository_model/saearch_model.dart';

class SearchImageViewModel extends ChangeNotifier {
  photoRepository repository;
  SearchModel? _photos;
  SearchImageViewModel(
    this.repository,
  );

  SearchModel? get photo => _photos;

  Future<void> fetch(String query) async {
    _photos = await repository.getPhotos(query);
    notifyListeners();
  }
}
