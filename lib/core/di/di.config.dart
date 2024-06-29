// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data_layer/datasource_contract/Auth_datasource.dart' as _i13;
import '../../data_layer/datasource_contract/brands_datasource.dart' as _i9;
import '../../data_layer/datasource_contract/cart_datasource.dart' as _i19;
import '../../data_layer/datasource_contract/categories_datasource.dart'
    as _i11;
import '../../data_layer/datasource_contract/product_datasource.dart' as _i15;
import '../../data_layer/datasource_contract/subCategory_datasource.dart'
    as _i4;
import '../../data_layer/datasource_impl/Auth_datasource_impl.dart' as _i14;
import '../../data_layer/datasource_impl/brands_datasource_impl.dart' as _i10;
import '../../data_layer/datasource_impl/cart_datasource_Impl.dart' as _i20;
import '../../data_layer/datasource_impl/categories_dataSource_impl.dart'
    as _i12;
import '../../data_layer/datasource_impl/product_datasource_impl.dart' as _i16;
import '../../data_layer/datasource_impl/subcategory_datasource_impl.dart'
    as _i5;
import '../../data_layer/repository_imp/Auth_repo_impl.dart' as _i24;
import '../../data_layer/repository_imp/brand_repo_impl.dart' as _i27;
import '../../data_layer/repository_imp/cart_repo_impl.dart' as _i33;
import '../../data_layer/repository_imp/category_repo_impl.dart' as _i22;
import '../../data_layer/repository_imp/product_repo_impl.dart' as _i18;
import '../../data_layer/repository_imp/subcategory_repo_impl.dart' as _i7;
import '../../Domain/repository_contract/Auth_repo.dart' as _i23;
import '../../Domain/repository_contract/Brand_repo.dart' as _i26;
import '../../Domain/repository_contract/cart-repo.dart' as _i32;
import '../../Domain/repository_contract/categories_repo.dart' as _i21;
import '../../Domain/repository_contract/Product_repo.dart' as _i17;
import '../../Domain/repository_contract/subcategory_repo.dart' as _i6;
import '../../Domain/usecases/add_to_cart_usecase.dart' as _i36;
import '../../Domain/usecases/Auth_usecase/SignIn_usecase.dart' as _i31;
import '../../Domain/usecases/Auth_usecase/Signup_usecase.dart' as _i28;
import '../../Domain/usecases/brands_usecase.dart' as _i35;
import '../../Domain/usecases/categories_usecase.dart' as _i30;
import '../../Domain/usecases/product_usecase.dart' as _i25;
import '../../Domain/usecases/subcategory_usecase.dart' as _i8;
import '../../presentation/home/tabs/category_tab/categoryViewModel/categoryViewModel.dart'
    as _i38;
import '../../presentation/home/tabs/hometab/view_model/HomeTab.dart' as _i37;
import '../../presentation/signin_user/sign_in_view_model_cubit.dart' as _i34;
import '../../presentation/signup_user/SignUp_ViewModel/sign_up_view_model_cubit.dart'
    as _i29;
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
    gh.factory<_i4.SubcategoryDataSource>(
        () => _i5.SubcategoryDatasourceImpl(apimanager: gh<_i3.ApiManager>()));
    gh.factory<_i6.SubcategoryRepo>(
        () => _i7.SubcategoryRepoImpl(gh<_i4.SubcategoryDataSource>()));
    gh.factory<_i8.SubcategoryUsecase>(
        () => _i8.SubcategoryUsecase(gh<_i6.SubcategoryRepo>()));
    gh.factory<_i9.BrandsDataSource>(
        () => _i10.BrandsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i11.categoriesDataSource>(
        () => _i12.CategoriesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i13.AuthDataSource>(
        () => _i14.AuthDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i15.ProductDataSource>(
        () => _i16.ProductDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i17.ProductRepo>(
        () => _i18.ProductRepoImpl(gh<_i15.ProductDataSource>()));
    gh.factory<_i19.CartDatasource>(
        () => _i20.CartDatasourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i21.CategoryRepo>(
        () => _i22.categoryRepoImpl(gh<_i11.categoriesDataSource>()));
    gh.factory<_i23.AuthRepo>(
        () => _i24.AuthRepoImpl(gh<_i13.AuthDataSource>()));
    gh.factory<_i25.MostSellingProductUseCase>(
        () => _i25.MostSellingProductUseCase(gh<_i17.ProductRepo>()));
    gh.factory<_i26.Brandrepo>(
        () => _i27.BrandRepoImpl(gh<_i9.BrandsDataSource>()));
    gh.factory<_i28.SignUpUsecase>(
        () => _i28.SignUpUsecase(gh<_i23.AuthRepo>()));
    gh.factory<_i29.SignUpViewModel>(
        () => _i29.SignUpViewModel(gh<_i28.SignUpUsecase>()));
    gh.factory<_i30.CategoriesUseCase>(
        () => _i30.CategoriesUseCase(gh<_i21.CategoryRepo>()));
    gh.factory<_i31.SignInUsecase>(
        () => _i31.SignInUsecase(authRepo: gh<_i23.AuthRepo>()));
    gh.factory<_i32.CartRepo>(
        () => _i33.CartRepoImpl(gh<_i19.CartDatasource>()));
    gh.factory<_i34.SignInViewModel>(
        () => _i34.SignInViewModel(gh<_i31.SignInUsecase>()));
    gh.factory<_i35.BrandUseCase>(
        () => _i35.BrandUseCase(gh<_i26.Brandrepo>()));
    gh.factory<_i36.AddToCartUsecase>(
        () => _i36.AddToCartUsecase(gh<_i32.CartRepo>()));
    gh.factory<_i37.HomeTabViewModel>(() => _i37.HomeTabViewModel(
          gh<_i30.CategoriesUseCase>(),
          gh<_i35.BrandUseCase>(),
          gh<_i25.MostSellingProductUseCase>(),
          gh<_i36.AddToCartUsecase>(),
        ));
    gh.factory<_i38.CategoryViewModel>(() => _i38.CategoryViewModel(
          gh<_i30.CategoriesUseCase>(),
          gh<_i8.SubcategoryUsecase>(),
        ));
    return this;
  }
}
