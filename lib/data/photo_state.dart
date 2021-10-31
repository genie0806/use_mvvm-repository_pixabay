import 'package:try_image_search/model/saearch_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_state.freezed.dart';

@freezed
abstract class PhotoState with _$PhotoState {
  factory PhotoState({SearchModel? searchModel}) = _PhotoState;
}
