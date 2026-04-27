// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:news_app/core/network/dio_client.dart' as _i232;
import 'package:news_app/core/network/network_info.dart' as _i215;
import 'package:news_app/features/auth/data/datasources/auth_remote_ds.dart'
    as _i228;
import 'package:news_app/features/auth/data/repositories/auth_repo_impl.dart'
    as _i390;
import 'package:news_app/features/auth/domain/repositories/auth_repository.dart'
    as _i204;
import 'package:news_app/features/auth/domain/usecases/login_usecase.dart'
    as _i170;
import 'package:news_app/features/auth/presentation/bloc/auth_bloc.dart'
    as _i1070;
import 'package:news_app/features/bookmark/data/datasources/bookmark_local_ds.dart'
    as _i932;
import 'package:news_app/features/bookmark/data/repositories/bookmark_repo_impl.dart'
    as _i501;
import 'package:news_app/features/bookmark/domain/repositories/bookmark_repository.dart'
    as _i343;
import 'package:news_app/features/bookmark/domain/usecases/bookmark_usecases.dart'
    as _i592;
import 'package:news_app/features/bookmark/presentation/bloc/bookmark_bloc.dart'
    as _i314;
import 'package:news_app/features/news/data/datasources/news_remote_ds.dart'
    as _i235;
import 'package:news_app/features/news/data/repositories/news_repo_impl.dart'
    as _i645;
import 'package:news_app/features/news/domain/repositories/news_repository.dart'
    as _i975;
import 'package:news_app/features/news/domain/usecases/get_top_headlines_uc.dart'
    as _i410;
import 'package:news_app/features/news/domain/usecases/search_articles_uc.dart'
    as _i34;
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart'
    as _i38;
import 'package:news_app/features/notification/data/services/fcm_service.dart'
    as _i390;
import 'package:news_app/features/notification/data/services/remote_config_service.dart'
    as _i578;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i161.InternetConnection>(
        () => networkModule.internetConnection);
    gh.lazySingleton<_i578.RemoteConfigService>(
        () => _i578.RemoteConfigService());
    gh.lazySingleton<_i390.FCMService>(() => _i390.FCMService());
    gh.lazySingleton<_i235.NewsRemoteDataSource>(
        () => _i235.NewsRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i228.AuthRemoteDataSource>(
        () => _i228.AuthRemoteDataSourceImpl());
    gh.lazySingleton<_i215.NetworkInfo>(
        () => _i215.NetworkInfoImpl(gh<_i161.InternetConnection>()));
    gh.lazySingleton<_i932.BookmarkLocalDataSource>(
        () => _i932.BookmarkLocalDataSourceImpl());
    gh.lazySingleton<_i343.BookmarkRepository>(() =>
        _i501.BookmarkRepositoryImpl(gh<_i932.BookmarkLocalDataSource>()));
    gh.lazySingleton<_i592.ToggleBookmarkUC>(
        () => _i592.ToggleBookmarkUC(gh<_i343.BookmarkRepository>()));
    gh.lazySingleton<_i592.GetBookmarksUC>(
        () => _i592.GetBookmarksUC(gh<_i343.BookmarkRepository>()));
    gh.lazySingleton<_i592.IsBookmarkedUC>(
        () => _i592.IsBookmarkedUC(gh<_i343.BookmarkRepository>()));
    gh.lazySingleton<_i204.AuthRepository>(() => _i390.AuthRepositoryImpl(
          remoteDataSource: gh<_i228.AuthRemoteDataSource>(),
          networkInfo: gh<_i215.NetworkInfo>(),
        ));
    gh.lazySingleton<_i975.NewsRepository>(() => _i645.NewsRepositoryImpl(
          remoteDataSource: gh<_i235.NewsRemoteDataSource>(),
          networkInfo: gh<_i215.NetworkInfo>(),
        ));
    gh.lazySingleton<_i410.GetTopHeadlinesUC>(
        () => _i410.GetTopHeadlinesUC(gh<_i975.NewsRepository>()));
    gh.lazySingleton<_i34.SearchArticlesUC>(
        () => _i34.SearchArticlesUC(gh<_i975.NewsRepository>()));
    gh.lazySingleton<_i170.LoginUseCase>(
        () => _i170.LoginUseCase(gh<_i204.AuthRepository>()));
    gh.factory<_i1070.AuthBloc>(
        () => _i1070.AuthBloc(loginUseCase: gh<_i170.LoginUseCase>()));
    gh.factory<_i38.NewsBloc>(() => _i38.NewsBloc(
          getTopHeadlinesUC: gh<_i410.GetTopHeadlinesUC>(),
          searchArticlesUC: gh<_i34.SearchArticlesUC>(),
        ));
    gh.factory<_i314.BookmarkBloc>(() => _i314.BookmarkBloc(
          getBookmarksUC: gh<_i592.GetBookmarksUC>(),
          toggleBookmarkUC: gh<_i592.ToggleBookmarkUC>(),
          isBookmarkedUC: gh<_i592.IsBookmarkedUC>(),
        ));
    return this;
  }
}

class _$DioModule extends _i232.DioModule {}

class _$NetworkModule extends _i215.NetworkModule {}
