// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data_layer/datasource_contract/categories_datasource.dart' as _i4;
import '../../data_layer/datasource_impl/categories_dataSource_impl.dart'
    as _i5;
import '../../data_layer/repository_imp/category_repo_impl.dart' as _i7;
import '../../Domain/repository_contract/categories_repo.dart' as _i6;
import '../../Domain/usecases/categories_usecase.dart' as _i8;
import '../../presentation/home/tabs/hometab/view_model/HomeTab.dart' as _i9;
import '../api/api_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.categoriesDataSource>(
        () => _i5.CategoriesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.CategoryRepo>(
        () => _i7.categoryRepoImpl(gh<_i4.categoriesDataSource>()));
    gh.factory<_i8.CategoriesUseCase>(
        () => _i8.CategoriesUseCase(gh<_i6.CategoryRepo>()));
    gh.factory<_i9.HomeTabViewModel>(
        () => _i9.HomeTabViewModel(gh<_i8.CategoriesUseCase>()));
    return this;
  }
}
