// 1. Provider 전체
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:try_image_search/data/repository/photo_repository_impl.dart';
import 'package:try_image_search/data/data_source/remote/pixabay_api.dart';
import 'package:try_image_search/domain/repository/repository.dart';
import 'package:try_image_search/domain/use_case/get_photos.dart';
import 'package:try_image_search/domain/use_case/main_use_cases.dart';
import 'package:try_image_search/presentation/mainview/view_model/search_image_view_model.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

// 2. 다른 클래스에 의존하지 않는 Model
List<SingleChildWidget> independentModels = [
  Provider<PixaBayApi>(
    create: (context) => PixaBayApi(),
  ),
];

// 3. 2에 등록한 클래스에 의존하는 Model
List<SingleChildWidget> dependentModels = [
  ProxyProvider<PixaBayApi, PhotoRepository>(
    update: (context, api, _) => PixabayPhotoRepositoryImpl(api),
  ),
  ProxyProvider<PhotoRepository, MainUseCases>(
    update: (context, repository, _) =>
        MainUseCases(getPhotos: GetPhotos(repository)),
  ),
];

// 4. ViewModels
// View가 사용. 2, 3에 등록한 클래스를 사용할 수 있음
List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<SearchImageViewModel>(
    create: (context) => SearchImageViewModel(context.read<MainUseCases>()
        //Provider.of<PhotoRepository>(context, listen: false),
        ),
  ),
];
