import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_image_search/presentation/mainview/view_model/search_image_view_model.dart';
import 'package:try_image_search/presentation/mainview/ui_event.dart';
import 'package:try_image_search/widget/card_widget.dart';
import 'package:try_image_search/widget/detiail_widget.dart';
import 'package:try_image_search/widget/search_bar_widget.dart';

class SearchImageView extends StatefulWidget {
  const SearchImageView({Key? key}) : super(key: key);

  @override
  _SearchImageViewState createState() => _SearchImageViewState();
}

class _SearchImageViewState extends State<SearchImageView> {
  final TextEditingController _searchController = TextEditingController();
  final query = '';

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<SearchImageViewModel>().fetch('iphone');
      context.read<SearchImageViewModel>().eventStream.listen((event) {
        if (event is Showsnackbar) {
          final snackbar = SnackBar(content: Text(event.message));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SearchImageViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pixabay Image Data'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Row(
              children: [
                Expanded(
                  child: SearchBar(
                      controller: _searchController,
                      onChanged: (query) {
                        setState(() {
                          query = query;
                        });
                      }),
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        viewModel.fetch(_searchController.text);
                      });
                    },
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/images/search.png'))),
              ],
            ),
          ),
          imageResultView(viewModel, context)
        ],
      ),
    );
  }

  Widget imageResultView(SearchImageViewModel viewModel, BuildContext context) {
    if (viewModel.state.searchModel != null) {
      final viewModel = context.watch<SearchImageViewModel>();
      return GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 0.85 / 1,
          crossAxisCount: 2,
          shrinkWrap: true,
          children: viewModel.state.searchModel!.hits!
              .where((e) =>
                  e.tags.toLowerCase().contains(query.trim().toLowerCase()))
              .map((e) => CardViewItem(
                    hit: e,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(detailData: e),
                        ),
                      );
                    },
                  ))
              .toList());
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
