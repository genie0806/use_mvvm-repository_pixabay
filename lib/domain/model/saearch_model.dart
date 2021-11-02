import 'package:try_image_search/domain/model/search_data.dart';

class SearchModel {
  int? total;
  int? totalHits;
  List<Hits>? hits;

  SearchModel({this.total, this.totalHits, this.hits});

  SearchModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalHits = json['totalHits'];
    if (json['hits'] != null) {
      hits = [];
      json['hits'].forEach((v) {
        hits?.add(Hits.fromJson(v));
      });
    }
  }
}
