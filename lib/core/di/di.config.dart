// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data_layer/datasource_contract/Auth_datasource.dart' as _i15;
import '../../data_layer/datasource_contract/brands_datasource.dart' as _i9;
import '../../data_layer/datasource_contract/cart_datasource.dart' as _i23;
import '../../data_layer/datasource_contract/categories_datasource.dart'
    as _i13;
import '../../data_layer/datasource_contract/get_user_dataSource.dart' as _i11;
import '../../data_layer/datasource_contract/product_datasource.dart' as _i17;
import '../../data_layer/datasource_contract/subCategory_datasource.dart'
    as _i4;
import '../../data_layer/datasource_impl/Auth_datasource_impl.dart' as _i16;
import '../../data_layer/datasource_impl/brands_datasource_impl.dart' as _i10;
import '../../data_layer/datasource_impl/cart_datasource_Impl.dart' as _i24;
import '../../data_layer/datasource_impl/categories_dataSource_impl.dart'
    as _i14;
import '../../data_layer/datasource_impl/getUser_datasourceImpl.dart' as _i12;
import '../../data_layer/datasource_impl/product_datasource_impl.dart' as _i18;
import '../../data_layer/datasource_impl/subcategory_datasource_impl.dart'
    as _i5;
import '../../data_layer/repository_imp/Auth_repo_impl.dart' as _i28;
import '../../data_layer/repository_imp/brand_repo_impl.dart' as _i31;
import '../../data_layer/repository_imp/cart_repo_impl.dart' as _i39;
import '../../data_layer/repository_imp/category_repo_impl.dart' as _i26;
import '../../data_layer/repository_imp/GetUser_repoImpl.dart' as _i20;
import '../../data_layer/repository_imp/product_repo_impl.dart' as _i22;
import '../../data_layer/repository_imp/subcategory_repo_impl.dart' as _i7;
import '../../Domain/repository_contract/Auth_repo.dart' as _i27;
import '../../Domain/repository_contract/Brand_repo.dart' as _i30;
import '../../Domain/repository_contract/cart-repo.dart' as _i38;
import '../../Domain/repository_contract/categories_repo.dart' as _i25;
import '../../Domain/repository_contract/GetUser_Repo.dart' as _i19;
import '../../Domain/repository_contract/Product_repo.dart' as _i21;
import '../../Domain/repository_contract/subcategory_repo.dart' as _i6;
import '../../Domain/usecases/add_to_cart_usecase.dart' as _i42;
import '../../Domain/usecases/Auth_usecase/SignIn_usecase.dart' as _i35;
import '../../Domain/usecases/Auth_usecase/Signup_usecase.dart' as _i32;
import '../../Domain/usecases/brands_usecase.dart' as _i41;
import '../../Domain/usecases/categories_usecase.dart' as _i34;
import '../../Domain/usecases/get_card.dart' as _i43;
import '../../Domain/usecases/get_user_usecase.dart' as _i36;
import '../../Domain/usecases/product_usecase.dart' as _i29;
import '../../Domain/usecases/subcategory_usecase.dart' as _i8;
import '../../Domain/usecases/update_usecase.dart' as _i44;
import '../../presentation/home/cart/Cart_ViewModel/cart_view_model_cubit.dart'
    as _i48;
import '../../presentation/home/tabs/category_tab/categoryViewModel/categoryViewModel.dart'
    as _i46;
import '../../presentation/home/tabs/hometab/view_model/Brand_viewModel.dart'
    as _i47;
import '../../presentation/home/tabs/hometab/view_model/HomeTab.dart' as _i45;
import '../../presentation/home/tabs/profile_tab/view_model/profile_view_model_cubit.dart'
    as _i37;
import '../../presentation/signin_user/sign_in_view_model_cubit.dart' as _i40;
import '../../presentation/signup_user/SignUp_ViewModel/sign_up_view_model_cubit.dart'
    as _i33;
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
    gh.factory<_i11.GetUserDataSource>(
        () => _i12.GetUserDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i13.categoriesDataSource>(
        () => _i14.CategoriesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i15.AuthDataSource>(
        () => _i16.AuthDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i17.ProductDataSource>(
        () => _i18.ProductDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i19.GetUserRepo>(
        () => _i20.GetUserDataRepoImpl(gh<_i11.GetUserDataSource>()));
    gh.factory<_i21.ProductRepo>(
        () => _i22.ProductRepoImpl(gh<_i17.ProductDataSource>()));
    gh.factory<_i23.CartDatasource>(
        () => _i24.CartDatasourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i25.CategoryRepo>(
        () => _i26.categoryRepoImpl(gh<_i13.categoriesDataSource>()));
    gh.factory<_i27.AuthRepo>(
        () => _i28.AuthRepoImpl(gh<_i15.AuthDataSource>()));
    gh.factory<_i29.MostSellingProductUseCase>(
        () => _i29.MostSellingProductUseCase(gh<_i21.ProductRepo>()));
    gh.factory<_i30.Brandrepo>(
        () => _i31.BrandRepoImpl(gh<_i9.BrandsDataSource>()));
    gh.factory<_i32.SignUpUsecase>(
        () => _i32.SignUpUsecase(gh<_i27.AuthRepo>()));
    gh.factory<_i33.SignUpViewModel>(
        () => _i33.SignUpViewModel(gh<_i32.SignUpUsecase>()));
    gh.factory<_i34.CategoriesUseCase>(
        () => _i34.CategoriesUseCase(gh<_i25.CategoryRepo>()));
    gh.factory<_i35.SignInUsecase>(
        () => _i35.SignInUsecase(authRepo: gh<_i27.AuthRepo>()));
    gh.factory<_i36.GetUserUsecase>(
        () => _i36.GetUserUsecase(gh<_i19.GetUserRepo>()));
    gh.factory<_i37.ProfileViewModel>(
        () => _i37.ProfileViewModel(gh<_i36.GetUserUsecase>()));
    gh.factory<_i38.CartRepo>(
        () => _i39.CartRepoImpl(gh<_i23.CartDatasource>()));
    gh.factory<_i40.SignInViewModel>(
        () => _i40.SignInViewModel(gh<_i35.SignInUsecase>()));
    gh.factory<_i41.BrandUseCase>(
        () => _i41.BrandUseCase(gh<_i30.Brandrepo>()));
    gh.factory<_i42.AddToCartUsecase>(
        () => _i42.AddToCartUsecase(gh<_i38.CartRepo>()));
    gh.factory<_i43.GetCardUsecase>(
        () => _i43.GetCardUsecase(gh<_i38.CartRepo>()));
    gh.factory<_i44.UpdateProduct_usecase>(
        () => _i44.UpdateProduct_usecase(gh<_i38.CartRepo>()));
    gh.factory<_i45.HomeTabViewModel>(() => _i45.HomeTabViewModel(
          gh<_i34.CategoriesUseCase>(),
          gh<_i41.BrandUseCase>(),
          gh<_i29.MostSellingProductUseCase>(),
          gh<_i42.AddToCartUsecase>(),
        ));
    gh.factory<_i46.CategoryViewModel>(() => _i46.CategoryViewModel(
          gh<_i34.CategoriesUseCase>(),
          gh<_i8.SubcategoryUsecase>(),
        ));
    gh.factory<_i47.BrandViewModel>(
        () => _i47.BrandViewModel(gh<_i41.BrandUseCase>()));
    gh.factory<_i48.CartViewModel>(() => _i48.CartViewModel(
          gh<_i43.GetCardUsecase>(),
          gh<_i42.AddToCartUsecase>(),
          gh<_i44.UpdateProduct_usecase>(),
        ));
    return this;
  }
}
