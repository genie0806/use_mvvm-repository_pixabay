import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_image_search/di/di.dart';
import 'package:try_image_search/data/data_source/remote/pixabay_api.dart';
import 'package:try_image_search/data/repository/photo_repository_impl.dart';
import 'package:try_image_search/domain/repository/repository.dart';
import 'package:try_image_search/presentation/mainview/search_page.dart';
import 'package:try_image_search/presentation/mainview/view_model/search_image_view_model.dart';

void main() {
  runApp(
      MultiProvider(providers: globalProviders, child: const TryImageSearch()));
}

class TryImageSearch extends StatelessWidget {
  const TryImageSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Try Image Search',
      home: SearchImageView(),
    );
  }
}
