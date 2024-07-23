// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data_layer/datasource_contract/Auth_datasource.dart' as _i19;
import '../../data_layer/datasource_contract/brands_datasource.dart' as _i9;
import '../../data_layer/datasource_contract/cart_datasource.dart' as _i29;
import '../../data_layer/datasource_contract/categories_datasource.dart'
    as _i17;
import '../../data_layer/datasource_contract/get_user_dataSource.dart' as _i13;
import '../../data_layer/datasource_contract/product_datasource.dart' as _i21;
import '../../data_layer/datasource_contract/subCategory_datasource.dart'
    as _i4;
import '../../data_layer/datasource_contract/wishlist_datasource/add_wishlist_datasource.dart'
    as _i15;
import '../../data_layer/datasource_contract/wishlist_datasource/get_wishlist_datasource.dart'
    as _i11;
import '../../data_layer/datasource_impl/Auth_datasource_impl.dart' as _i20;
import '../../data_layer/datasource_impl/brands_datasource_impl.dart' as _i10;
import '../../data_layer/datasource_impl/cart_datasource_Impl.dart' as _i30;
import '../../data_layer/datasource_impl/categories_dataSource_impl.dart'
    as _i18;
import '../../data_layer/datasource_impl/getUser_datasourceImpl.dart' as _i14;
import '../../data_layer/datasource_impl/product_datasource_impl.dart' as _i22;
import '../../data_layer/datasource_impl/subcategory_datasource_impl.dart'
    as _i5;
import '../../data_layer/datasource_impl/wishlist_datasource_impl/add_wishlist_datasourceImpl.dart'
    as _i16;
import '../../data_layer/datasource_impl/wishlist_datasource_impl/get_wishlist_datasource_impl.dart'
    as _i12;
import '../../data_layer/repository_imp/Auth_repo_impl.dart' as _i34;
import '../../data_layer/repository_imp/brand_repo_impl.dart' as _i38;
import '../../data_layer/repository_imp/cart_repo_impl.dart' as _i49;
import '../../data_layer/repository_imp/category_repo_impl.dart' as _i32;
import '../../data_layer/repository_imp/GetUser_repoImpl.dart' as _i24;
import '../../data_layer/repository_imp/product_repo_impl.dart' as _i26;
import '../../data_layer/repository_imp/subcategory_repo_impl.dart' as _i7;
import '../../data_layer/repository_imp/wishlist_repo_impl/add_wishlist_repo_impl.dart'
    as _i28;
import '../../data_layer/repository_imp/wishlist_repo_impl/get_wishlist_repo_impl.dart'
    as _i41;
import '../../Domain/repository_contract/Auth_repo.dart' as _i33;
import '../../Domain/repository_contract/Brand_repo.dart' as _i37;
import '../../Domain/repository_contract/cart-repo.dart' as _i48;
import '../../Domain/repository_contract/categories_repo.dart' as _i31;
import '../../Domain/repository_contract/GetUser_Repo.dart' as _i23;
import '../../Domain/repository_contract/Product_repo.dart' as _i25;
import '../../Domain/repository_contract/subcategory_repo.dart' as _i6;
import '../../Domain/repository_contract/wishlist_repo/add_wishlist_repo.dart'
    as _i27;
import '../../Domain/repository_contract/wishlist_repo/get_wishlist_repo.dart'
    as _i40;
import '../../Domain/usecases/add_to_cart_usecase.dart' as _i53;
import '../../Domain/usecases/add_wishlist_usecase.dart' as _i35;
import '../../Domain/usecases/Auth_usecase/SignIn_usecase.dart' as _i45;
import '../../Domain/usecases/Auth_usecase/Signup_usecase.dart' as _i39;
import '../../Domain/usecases/brands_usecase.dart' as _i52;
import '../../Domain/usecases/categories_usecase.dart' as _i43;
import '../../Domain/usecases/get_card.dart' as _i54;
import '../../Domain/usecases/get_user_usecase.dart' as _i46;
import '../../Domain/usecases/get_wishlist_usecase.dart' as _i44;
import '../../Domain/usecases/product_usecase.dart' as _i36;
import '../../Domain/usecases/subcategory_usecase.dart' as _i8;
import '../../Domain/usecases/update_usecase.dart' as _i55;
import '../../presentation/home/cart/Cart_ViewModel/cart_view_model_cubit.dart'
    as _i59;
import '../../presentation/home/tabs/category_tab/categoryViewModel/categoryViewModel.dart'
    as _i56;
import '../../presentation/home/tabs/hometab/view_model/Brand_viewModel.dart'
    as _i57;
import '../../presentation/home/tabs/hometab/view_model/HomeTab.dart' as _i58;
import '../../presentation/home/tabs/profile_tab/view_model/profile_view_model_cubit.dart'
    as _i47;
import '../../presentation/home/tabs/watchlist_tab/wishlist_viewmodel/wishlist_view_model_cubit.dart'
    as _i50;
import '../../presentation/signin_user/sign_in_view_model_cubit.dart' as _i51;
import '../../presentation/signup_user/SignUp_ViewModel/sign_up_view_model_cubit.dart'
    as _i42;
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
    gh.factory<_i11.GetWishlistDatasource>(
        () => _i12.GetWishListDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i13.GetUserDataSource>(
        () => _i14.GetUserDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i15.AddWishlistDatasource>(
        () => _i16.WishlistDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i17.categoriesDataSource>(
        () => _i18.CategoriesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i19.AuthDataSource>(
        () => _i20.AuthDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i21.ProductDataSource>(
        () => _i22.ProductDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i23.GetUserRepo>(
        () => _i24.GetUserDataRepoImpl(gh<_i13.GetUserDataSource>()));
    gh.factory<_i25.ProductRepo>(
        () => _i26.ProductRepoImpl(gh<_i21.ProductDataSource>()));
    gh.factory<_i27.AddWishListRepo>(
        () => _i28.AddWishListRepoImpl(gh<_i15.AddWishlistDatasource>()));
    gh.factory<_i29.CartDatasource>(
        () => _i30.CartDatasourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i31.CategoryRepo>(
        () => _i32.categoryRepoImpl(gh<_i17.categoriesDataSource>()));
    gh.factory<_i33.AuthRepo>(
        () => _i34.AuthRepoImpl(gh<_i19.AuthDataSource>()));
    gh.factory<_i35.AddWishListUsecase>(
        () => _i35.AddWishListUsecase(gh<_i27.AddWishListRepo>()));
    gh.factory<_i36.MostSellingProductUseCase>(
        () => _i36.MostSellingProductUseCase(gh<_i25.ProductRepo>()));
    gh.factory<_i37.Brandrepo>(
        () => _i38.BrandRepoImpl(gh<_i9.BrandsDataSource>()));
    gh.factory<_i39.SignUpUsecase>(
        () => _i39.SignUpUsecase(gh<_i33.AuthRepo>()));
    gh.factory<_i40.GetWishListRepo>(
        () => _i41.GetWishlistRepoImpl(gh<_i11.GetWishlistDatasource>()));
    gh.factory<_i42.SignUpViewModel>(
        () => _i42.SignUpViewModel(gh<_i39.SignUpUsecase>()));
    gh.factory<_i43.CategoriesUseCase>(
        () => _i43.CategoriesUseCase(gh<_i31.CategoryRepo>()));
    gh.factory<_i44.GetWishListUseCase>(
        () => _i44.GetWishListUseCase(gh<_i40.GetWishListRepo>()));
    gh.factory<_i45.SignInUsecase>(
        () => _i45.SignInUsecase(authRepo: gh<_i33.AuthRepo>()));
    gh.factory<_i46.GetUserUsecase>(
        () => _i46.GetUserUsecase(gh<_i23.GetUserRepo>()));
    gh.factory<_i47.ProfileViewModel>(
        () => _i47.ProfileViewModel(gh<_i46.GetUserUsecase>()));
    gh.factory<_i48.CartRepo>(
        () => _i49.CartRepoImpl(gh<_i29.CartDatasource>()));
    gh.factory<_i50.WishlistViewModel>(
        () => _i50.WishlistViewModel(gh<_i44.GetWishListUseCase>()));
    gh.factory<_i51.SignInViewModel>(
        () => _i51.SignInViewModel(gh<_i45.SignInUsecase>()));
    gh.factory<_i52.BrandUseCase>(
        () => _i52.BrandUseCase(gh<_i37.Brandrepo>()));
    gh.factory<_i53.AddToCartUsecase>(
        () => _i53.AddToCartUsecase(gh<_i48.CartRepo>()));
    gh.factory<_i54.GetCardUsecase>(
        () => _i54.GetCardUsecase(gh<_i48.CartRepo>()));
    gh.factory<_i55.UpdateProduct_usecase>(
        () => _i55.UpdateProduct_usecase(gh<_i48.CartRepo>()));
    gh.factory<_i56.CategoryViewModel>(() => _i56.CategoryViewModel(
          gh<_i43.CategoriesUseCase>(),
          gh<_i8.SubcategoryUsecase>(),
        ));
    gh.factory<_i57.BrandViewModel>(
        () => _i57.BrandViewModel(gh<_i52.BrandUseCase>()));
    gh.factory<_i58.HomeTabViewModel>(() => _i58.HomeTabViewModel(
          gh<_i43.CategoriesUseCase>(),
          gh<_i52.BrandUseCase>(),
          gh<_i36.MostSellingProductUseCase>(),
          gh<_i53.AddToCartUsecase>(),
          gh<_i35.AddWishListUsecase>(),
        ));
    gh.factory<_i59.CartViewModel>(() => _i59.CartViewModel(
          gh<_i54.GetCardUsecase>(),
          gh<_i53.AddToCartUsecase>(),
          gh<_i55.UpdateProduct_usecase>(),
        ));
    return this;
  }
}
