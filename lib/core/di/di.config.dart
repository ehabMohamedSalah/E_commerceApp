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
import '../../data_layer/datasource_contract/cart_datasource.dart' as _i33;
import '../../data_layer/datasource_contract/categories_datasource.dart'
    as _i17;
import '../../data_layer/datasource_contract/del_cart_itemDatasource.dart'
    as _i29;
import '../../data_layer/datasource_contract/get_user_dataSource.dart' as _i13;
import '../../data_layer/datasource_contract/product_datasource.dart' as _i21;
import '../../data_layer/datasource_contract/subCategory_datasource.dart'
    as _i4;
import '../../data_layer/datasource_contract/wishlist_datasource/add_wishlist_datasource.dart'
    as _i15;
import '../../data_layer/datasource_contract/wishlist_datasource/get_wishlist_datasource.dart'
    as _i11;
import '../../data_layer/datasource_contract/wishlist_delete_datasource.dart'
    as _i23;
import '../../data_layer/datasource_impl/Auth_datasource_impl.dart' as _i20;
import '../../data_layer/datasource_impl/brands_datasource_impl.dart' as _i10;
import '../../data_layer/datasource_impl/cart_datasource_Impl.dart' as _i34;
import '../../data_layer/datasource_impl/categories_dataSource_impl.dart'
    as _i18;
import '../../data_layer/datasource_impl/del_cartItem_Datasource_impl.dart'
    as _i30;
import '../../data_layer/datasource_impl/getUser_datasourceImpl.dart' as _i14;
import '../../data_layer/datasource_impl/product_datasource_impl.dart' as _i22;
import '../../data_layer/datasource_impl/subcategory_datasource_impl.dart'
    as _i5;
import '../../data_layer/datasource_impl/wishlist_datasource_impl/add_wishlist_datasourceImpl.dart'
    as _i16;
import '../../data_layer/datasource_impl/wishlist_datasource_impl/delete_wishlist_datasource_impl.dart'
    as _i24;
import '../../data_layer/datasource_impl/wishlist_datasource_impl/get_wishlist_datasource_impl.dart'
    as _i12;
import '../../data_layer/repository_imp/Auth_repo_impl.dart' as _i38;
import '../../data_layer/repository_imp/brand_repo_impl.dart' as _i42;
import '../../data_layer/repository_imp/cart_repo_impl.dart' as _i58;
import '../../data_layer/repository_imp/category_repo_impl.dart' as _i36;
import '../../data_layer/repository_imp/delete_cartitem_repo_Impl.dart' as _i51;
import '../../data_layer/repository_imp/GetUser_repoImpl.dart' as _i26;
import '../../data_layer/repository_imp/product_repo_impl.dart' as _i28;
import '../../data_layer/repository_imp/subcategory_repo_impl.dart' as _i7;
import '../../data_layer/repository_imp/wishlist_repo_impl/add_wishlist_repo_impl.dart'
    as _i32;
import '../../data_layer/repository_imp/wishlist_repo_impl/delete_wishlist_repo_impl.dart'
    as _i45;
import '../../data_layer/repository_imp/wishlist_repo_impl/get_wishlist_repo_impl.dart'
    as _i47;
import '../../Domain/repository_contract/Auth_repo.dart' as _i37;
import '../../Domain/repository_contract/Brand_repo.dart' as _i41;
import '../../Domain/repository_contract/cart-repo.dart' as _i57;
import '../../Domain/repository_contract/categories_repo.dart' as _i35;
import '../../Domain/repository_contract/del_cart_item_repo.dart' as _i50;
import '../../Domain/repository_contract/GetUser_Repo.dart' as _i25;
import '../../Domain/repository_contract/Product_repo.dart' as _i27;
import '../../Domain/repository_contract/subcategory_repo.dart' as _i6;
import '../../Domain/repository_contract/wishlist_repo/add_wishlist_repo.dart'
    as _i31;
import '../../Domain/repository_contract/wishlist_repo/delete_wishlist_repo.dart'
    as _i44;
import '../../Domain/repository_contract/wishlist_repo/get_wishlist_repo.dart'
    as _i46;
import '../../Domain/usecases/add_to_cart_usecase.dart' as _i62;
import '../../Domain/usecases/add_wishlist_usecase.dart' as _i39;
import '../../Domain/usecases/Auth_usecase/SignIn_usecase.dart' as _i54;
import '../../Domain/usecases/Auth_usecase/Signup_usecase.dart' as _i43;
import '../../Domain/usecases/brands_usecase.dart' as _i61;
import '../../Domain/usecases/categories_usecase.dart' as _i52;
import '../../Domain/usecases/del_cartitem_usecase.dart' as _i59;
import '../../Domain/usecases/delete_wishlist_usecase.dart' as _i49;
import '../../Domain/usecases/get_card.dart' as _i63;
import '../../Domain/usecases/get_user_usecase.dart' as _i55;
import '../../Domain/usecases/get_wishlist_usecase.dart' as _i53;
import '../../Domain/usecases/product_usecase.dart' as _i40;
import '../../Domain/usecases/subcategory_usecase.dart' as _i8;
import '../../Domain/usecases/update_usecase.dart' as _i64;
import '../../presentation/home/cart/Cart_ViewModel/cart_view_model_cubit.dart'
    as _i68;
import '../../presentation/home/tabs/category_tab/categoryViewModel/categoryViewModel.dart'
    as _i66;
import '../../presentation/home/tabs/hometab/view_model/Brand_viewModel.dart'
    as _i67;
import '../../presentation/home/tabs/hometab/view_model/HomeTab.dart' as _i69;
import '../../presentation/home/tabs/profile_tab/view_model/profile_view_model_cubit.dart'
    as _i56;
import '../../presentation/home/tabs/watchlist_tab/wishlist_viewmodel/wishlist_view_model_cubit.dart'
    as _i65;
import '../../presentation/signin_user/sign_in_view_model_cubit.dart' as _i60;
import '../../presentation/signup_user/SignUp_ViewModel/sign_up_view_model_cubit.dart'
    as _i48;
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
    gh.factory<_i23.WishListDeleteDataSource>(
        () => _i24.WishListDeleteDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i25.GetUserRepo>(
        () => _i26.GetUserDataRepoImpl(gh<_i13.GetUserDataSource>()));
    gh.factory<_i27.ProductRepo>(
        () => _i28.ProductRepoImpl(gh<_i21.ProductDataSource>()));
    gh.factory<_i29.DeleteCartItemDatasource>(
        () => _i30.DeleteCartItemDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i31.AddWishListRepo>(
        () => _i32.AddWishListRepoImpl(gh<_i15.AddWishlistDatasource>()));
    gh.factory<_i33.CartDatasource>(
        () => _i34.CartDatasourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i35.CategoryRepo>(
        () => _i36.categoryRepoImpl(gh<_i17.categoriesDataSource>()));
    gh.factory<_i37.AuthRepo>(
        () => _i38.AuthRepoImpl(gh<_i19.AuthDataSource>()));
    gh.factory<_i39.AddWishListUsecase>(
        () => _i39.AddWishListUsecase(gh<_i31.AddWishListRepo>()));
    gh.factory<_i40.MostSellingProductUseCase>(
        () => _i40.MostSellingProductUseCase(gh<_i27.ProductRepo>()));
    gh.factory<_i41.Brandrepo>(
        () => _i42.BrandRepoImpl(gh<_i9.BrandsDataSource>()));
    gh.factory<_i43.SignUpUsecase>(
        () => _i43.SignUpUsecase(gh<_i37.AuthRepo>()));
    gh.factory<_i44.DeleteWishListRepo>(
        () => _i45.WishListDeleteRepoImpl(gh<_i23.WishListDeleteDataSource>()));
    gh.factory<_i46.GetWishListRepo>(
        () => _i47.GetWishlistRepoImpl(gh<_i11.GetWishlistDatasource>()));
    gh.factory<_i48.SignUpViewModel>(
        () => _i48.SignUpViewModel(gh<_i43.SignUpUsecase>()));
    gh.factory<_i49.DeleteWishListUsecase>(
        () => _i49.DeleteWishListUsecase(gh<_i44.DeleteWishListRepo>()));
    gh.factory<_i50.DeleteCartItemRepo>(
        () => _i51.DelCartItemRepoImpl(gh<_i29.DeleteCartItemDatasource>()));
    gh.factory<_i52.CategoriesUseCase>(
        () => _i52.CategoriesUseCase(gh<_i35.CategoryRepo>()));
    gh.factory<_i53.GetWishListUseCase>(
        () => _i53.GetWishListUseCase(gh<_i46.GetWishListRepo>()));
    gh.factory<_i54.SignInUsecase>(
        () => _i54.SignInUsecase(authRepo: gh<_i37.AuthRepo>()));
    gh.factory<_i55.GetUserUsecase>(
        () => _i55.GetUserUsecase(gh<_i25.GetUserRepo>()));
    gh.factory<_i56.ProfileViewModel>(
        () => _i56.ProfileViewModel(gh<_i55.GetUserUsecase>()));
    gh.factory<_i57.CartRepo>(
        () => _i58.CartRepoImpl(gh<_i33.CartDatasource>()));
    gh.factory<_i59.DeleteCartItemUseCase>(
        () => _i59.DeleteCartItemUseCase(gh<_i50.DeleteCartItemRepo>()));
    gh.factory<_i60.SignInViewModel>(
        () => _i60.SignInViewModel(gh<_i54.SignInUsecase>()));
    gh.factory<_i61.BrandUseCase>(
        () => _i61.BrandUseCase(gh<_i41.Brandrepo>()));
    gh.factory<_i62.AddToCartUsecase>(
        () => _i62.AddToCartUsecase(gh<_i57.CartRepo>()));
    gh.factory<_i63.GetCardUsecase>(
        () => _i63.GetCardUsecase(gh<_i57.CartRepo>()));
    gh.factory<_i64.UpdateProduct_usecase>(
        () => _i64.UpdateProduct_usecase(gh<_i57.CartRepo>()));
    gh.factory<_i65.WishlistViewModel>(() => _i65.WishlistViewModel(
          gh<_i53.GetWishListUseCase>(),
          gh<_i49.DeleteWishListUsecase>(),
        ));
    gh.factory<_i66.CategoryViewModel>(() => _i66.CategoryViewModel(
          gh<_i52.CategoriesUseCase>(),
          gh<_i8.SubcategoryUsecase>(),
        ));
    gh.factory<_i67.BrandViewModel>(
        () => _i67.BrandViewModel(gh<_i61.BrandUseCase>()));
    gh.factory<_i68.CartViewModel>(() => _i68.CartViewModel(
          gh<_i63.GetCardUsecase>(),
          gh<_i62.AddToCartUsecase>(),
          gh<_i64.UpdateProduct_usecase>(),
          gh<_i59.DeleteCartItemUseCase>(),
        ));
    gh.factory<_i69.HomeTabViewModel>(() => _i69.HomeTabViewModel(
          gh<_i52.CategoriesUseCase>(),
          gh<_i61.BrandUseCase>(),
          gh<_i40.MostSellingProductUseCase>(),
          gh<_i62.AddToCartUsecase>(),
          gh<_i39.AddWishListUsecase>(),
        ));
    return this;
  }
}
