import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:try_image_search/domain/repository/repository.dart';
import 'package:try_image_search/domain/repository/result.dart';
import 'package:try_image_search/domain/model/saearch_model.dart';
import 'package:try_image_search/presentation/mainview/view_model/photo_state.dart';
import 'package:try_image_search/presentation/mainview/ui_event.dart';

class SearchImageViewModel extends ChangeNotifier {
  PhotoRepository repository;
  SearchImageViewModel(
    this.repository,
  );

  PhotoState _state = PhotoState();
  PhotoState get state => _state;

  final _eventController = StreamController<UiEvent>();
  Stream<UiEvent> get eventStream => _eventController.stream;

  Future<void> fetch(String query) async {
    final result = await repository.getPhotos(query);

    if (result is Success) {
      final resultPhotos = (result as Success<SearchModel>).data;
      _state = _state.copyWith(searchModel: resultPhotos);
      notifyListeners();
    } else if (result is Error) {
      print((result as Error).e.toString());
      _eventController.add(UiEvent.showSnackBar('네트워크 에러다'));
    }
  }
}
