import 'package:flutter/cupertino.dart';

import 'package:try_image_search/data/photo_state.dart';
import 'package:try_image_search/data/repository.dart';
import 'package:try_image_search/model/saearch_model.dart';

class SearchImageViewModel extends ChangeNotifier {
  PhotoRepository repository;
  SearchImageViewModel(
    this.repository,
  );

  PhotoState _state = PhotoState();
  PhotoState get state => _state;

  Future<void> fetch(String query) async {
    final result = await repository.getPhotos(query);
    _state = _state.copyWith(searchModel: result);
    notifyListeners();
  }
}
