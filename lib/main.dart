import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_image_search/View/search_page.dart';
import 'package:try_image_search/repository_model/photo_repository_impl.dart';
import 'package:try_image_search/view_model/search_image_view_model.dart';

void main() {
  final repository = PixabayPhotoRepositoryImpl();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: SearchImageViewModel(repository))
  ], child: const TryImageSearch()));
}

class TryImageSearch extends StatelessWidget {
  const TryImageSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Try Image Search',
      home: const SearchImageView(),
    );
  }
}
