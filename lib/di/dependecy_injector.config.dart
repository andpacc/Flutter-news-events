// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:example/data/data_constants.dart' as _i5;
import 'package:example/data/datasources/agenda_datasource.dart' as _i22;
import 'package:example/data/datasources/chat_datasource.dart' as _i6;
import 'package:example/data/datasources/localidades_datasource.dart' as _i31;
import 'package:example/data/datasources/lugares_datasource.dart' as _i34;
import 'package:example/data/datasources/music_datasource.dart' as _i37;
import 'package:example/data/datasources/news_datasource.dart' as _i40;
import 'package:example/data/datasources/video_datasource.dart' as _i18;
import 'package:example/data/repositories/agenda_repository_impl.dart' as _i24;
import 'package:example/data/repositories/chat_repository_impl.dart' as _i8;
import 'package:example/data/repositories/localidades_repository_impl.dart'
    as _i33;
import 'package:example/data/repositories/lugares_repository_impl.dart' as _i36;
import 'package:example/data/repositories/music_repository_impl.dart' as _i39;
import 'package:example/data/repositories/news_repository_impl.dart' as _i42;
import 'package:example/data/repositories/video_repository_impl.dart' as _i20;
import 'package:example/device/repositories/agenda_favs_repository_impl.dart'
    as _i4;
import 'package:example/device/repositories/local_storage.dart' as _i30;
import 'package:example/device/repositories/news_favs_repository_impl.dart'
    as _i13;
import 'package:example/di/injectable_resources.dart' as _i56;
import 'package:example/domain/repositories/agenda_fav_repository.dart' as _i3;
import 'package:example/domain/repositories/agenda_repository.dart' as _i23;
import 'package:example/domain/repositories/chat_repository.dart' as _i7;
import 'package:example/domain/repositories/localidades_repository.dart'
    as _i32;
import 'package:example/domain/repositories/lugar_repository.dart' as _i35;
import 'package:example/domain/repositories/music_repository.dart' as _i38;
import 'package:example/domain/repositories/news_fav_repository.dart' as _i12;
import 'package:example/domain/repositories/news_repository.dart' as _i41;
import 'package:example/domain/repositories/video_repository.dart' as _i19;
import 'package:example/domain/usecases/example_usecase.dart' as _i45;
import 'package:example/domain/usecases/get_agenda.dart' as _i27;
import 'package:example/domain/usecases/get_agenda_categories_usecase.dart'
    as _i26;
import 'package:example/domain/usecases/get_agenda_favs.dart' as _i9;
import 'package:example/domain/usecases/get_agenda_sugerencias_usecase.dart'
    as _i44;
import 'package:example/domain/usecases/get_localidades_usecase.dart' as _i46;
import 'package:example/domain/usecases/get_lugares_usecase.dart' as _i47;
import 'package:example/domain/usecases/get_music_category_usecase.dart'
    as _i48;
import 'package:example/domain/usecases/get_music_usecase.dart' as _i49;
import 'package:example/domain/usecases/get_news.dart' as _i51;
import 'package:example/domain/usecases/get_news_category_usecase.dart' as _i50;
import 'package:example/domain/usecases/get_news_favs.dart' as _i21;
import 'package:example/domain/usecases/get_open_ai_answer.dart' as _i11;
import 'package:example/domain/usecases/get_video.usecase.dart' as _i28;
import 'package:example/domain/usecases/get_videos_category_usecases.dart'
    as _i29;
import 'package:example/presentation/blocs/notifications/notifications_bloc.dart'
    as _i14;
import 'package:example/presentation/blocs/theme/theme_bloc.dart' as _i17;
import 'package:example/presentation/pages/agenda/bloc/agenda_bloc.dart'
    as _i55;
import 'package:example/presentation/pages/chat/bloc/chat_bloc.dart' as _i25;
import 'package:example/presentation/pages/maps/bloc/map_bloc.dart' as _i52;
import 'package:example/presentation/pages/noticias/bloc/noticias_bloc.dart'
    as _i53;
import 'package:example/presentation/pages/play/music_play/music_bloc/play_music_bloc.dart'
    as _i54;
import 'package:example/presentation/pages/play/video_play/video_bloc/play_video_bloc.dart'
    as _i43;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i10;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i15;
import 'package:supabase_flutter/supabase_flutter.dart' as _i16;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableResources = _$InjectableResources();
    gh.lazySingleton<_i3.AgendaFavRepository>(
        () => _i4.AgendaFavRepositoryImpl());
    gh.singleton<_i5.ApiHeaders>(() => _i5.ApiHeaders());
    gh.lazySingleton<_i6.ChatDataSource>(() => _i6.ChatDataSourceImpl());
    gh.lazySingleton<_i7.ChatRepository>(
        () => _i8.ChatRepositoryImpl(gh<_i6.ChatDataSource>()));
    gh.lazySingleton<_i9.ClearAgendaFavsNewsUseCase>(
        () => _i9.ClearAgendaFavsNewsUseCase(gh<_i3.AgendaFavRepository>()));
    gh.lazySingleton<_i9.ClearAllFavsNewsUseCase>(
        () => _i9.ClearAllFavsNewsUseCase(gh<_i3.AgendaFavRepository>()));
    gh.factory<_i10.Client>(() => injectableResources.httpClient);
    gh.lazySingleton<_i9.GetAgendaFavsNewsUseCase>(
        () => _i9.GetAgendaFavsNewsUseCase(gh<_i3.AgendaFavRepository>()));
    gh.lazySingleton<_i11.GetOpenAiAnswer>(
        () => _i11.GetOpenAiAnswer(gh<_i7.ChatRepository>()));
    gh.lazySingleton<_i12.NewsFavsRepository>(
        () => _i13.NewsFavsRepositoryImpl());
    gh.factory<_i14.NotificationsBloc>(() => _i14.NotificationsBloc());
    await gh.factoryAsync<_i15.SharedPreferences>(
      () => injectableResources.storage,
      preResolve: true,
    );
    gh.factory<String>(
      () => injectableResources.baseUrl,
      instanceName: 'BaseUrl',
    );
    await gh.singletonAsync<_i16.SupabaseClient>(
      () => injectableResources.supabase,
      preResolve: true,
    );
    gh.factory<_i17.ThemeBloc>(() => _i17.ThemeBloc());
    gh.lazySingleton<_i18.VideoDataSource>(
        () => _i18.VideoDataSourceImpl(gh<_i16.SupabaseClient>()));
    gh.lazySingleton<_i19.VideoRepository>(
        () => _i20.VideoRepositoryImpl(gh<_i18.VideoDataSource>()));
    gh.lazySingleton<_i9.AddAgendaFavsNewsUseCase>(
        () => _i9.AddAgendaFavsNewsUseCase(gh<_i3.AgendaFavRepository>()));
    gh.lazySingleton<_i21.AddFavsNewsUseCase>(
        () => _i21.AddFavsNewsUseCase(gh<_i12.NewsFavsRepository>()));
    gh.lazySingleton<_i22.AgendaDataSource>(
        () => _i22.AgendaDataSourceImpl(gh<_i16.SupabaseClient>()));
    gh.lazySingleton<_i23.AgendaRepository>(
        () => _i24.AgendaRepositoryImpl(gh<_i22.AgendaDataSource>()));
    gh.factory<_i25.ChatBloc>(() => _i25.ChatBloc(gh<_i11.GetOpenAiAnswer>()));
    gh.lazySingleton<_i21.ClearAllFavsNewsUseCase>(
        () => _i21.ClearAllFavsNewsUseCase(gh<_i12.NewsFavsRepository>()));
    gh.lazySingleton<_i21.ClearFavsNewsUseCase>(
        () => _i21.ClearFavsNewsUseCase(gh<_i12.NewsFavsRepository>()));
    gh.lazySingleton<_i26.GetAgendaCategoriesUseCase>(
        () => _i26.GetAgendaCategoriesUseCase(gh<_i23.AgendaRepository>()));
    gh.lazySingleton<_i27.GetAgendaNewsUseCase>(
        () => _i27.GetAgendaNewsUseCase(gh<_i23.AgendaRepository>()));
    gh.lazySingleton<_i21.GetFavsNewsUseCase>(
        () => _i21.GetFavsNewsUseCase(gh<_i12.NewsFavsRepository>()));
    gh.lazySingleton<_i28.GetVideoUseCase>(
        () => _i28.GetVideoUseCase(gh<_i19.VideoRepository>()));
    gh.lazySingleton<_i29.GetVideosCategoryUseCase>(
        () => _i29.GetVideosCategoryUseCase(gh<_i19.VideoRepository>()));
    gh.lazySingleton<_i30.LocalStorage>(
        () => _i30.LocalStorageImpl(gh<_i15.SharedPreferences>()));
    gh.lazySingleton<_i31.LocalidadesDataSource>(
        () => _i31.LocalidadesDataSourceImpl(gh<_i16.SupabaseClient>()));
    gh.lazySingleton<_i32.LocalidadesRepository>(
        () => _i33.LocalidadesRepositoryImpl(gh<_i31.LocalidadesDataSource>()));
    gh.lazySingleton<_i34.LugaresDataSource>(
        () => _i34.LugaresDataSourceImpl(gh<_i16.SupabaseClient>()));
    gh.lazySingleton<_i35.LugaresEventosRepository>(() =>
        _i36.LugaresEventosRepositoryImplementation(
            gh<_i34.LugaresDataSource>()));
    gh.lazySingleton<_i37.MusicDatasource>(
        () => _i37.MusicDatasourceImpl(gh<_i16.SupabaseClient>()));
    gh.lazySingleton<_i38.MusicRepository>(
        () => _i39.MusicRepositoryImpl(gh<_i37.MusicDatasource>()));
    gh.lazySingleton<_i40.NewsDatasource>(
        () => _i40.NewsDataSourceImpl(gh<_i16.SupabaseClient>()));
    gh.lazySingleton<_i41.NewsRepository>(
        () => _i42.NewsRepositoryImpl(gh<_i40.NewsDatasource>()));
    gh.factory<_i43.PlayVideoBloc>(() => _i43.PlayVideoBloc(
          gh<_i28.GetVideoUseCase>(),
          gh<_i29.GetVideosCategoryUseCase>(),
        ));
    gh.lazySingleton<_i44.AddAgendaSugerenciasUsecase>(
        () => _i44.AddAgendaSugerenciasUsecase(gh<_i23.AgendaRepository>()));
    gh.lazySingleton<_i45.ExampleUseCase>(
        () => _i45.ExampleUseCase(gh<_i41.NewsRepository>()));
    gh.lazySingleton<_i46.GetLocalidadesUseCase>(
        () => _i46.GetLocalidadesUseCase(gh<_i32.LocalidadesRepository>()));
    gh.lazySingleton<_i47.GetLugaresUseCase>(
        () => _i47.GetLugaresUseCase(gh<_i35.LugaresEventosRepository>()));
    gh.lazySingleton<_i48.GetMusicCategoryUseCase>(
        () => _i48.GetMusicCategoryUseCase(gh<_i38.MusicRepository>()));
    gh.lazySingleton<_i49.GetMusicUseCase>(
        () => _i49.GetMusicUseCase(gh<_i38.MusicRepository>()));
    gh.lazySingleton<_i50.GetNewsCategoryUseCase>(
        () => _i50.GetNewsCategoryUseCase(gh<_i41.NewsRepository>()));
    gh.lazySingleton<_i51.GetNewsUseCase>(
        () => _i51.GetNewsUseCase(gh<_i41.NewsRepository>()));
    gh.factory<_i52.MapBloc>(() => _i52.MapBloc(
          gh<_i27.GetAgendaNewsUseCase>(),
          gh<_i47.GetLugaresUseCase>(),
        ));
    gh.factory<_i53.NoticiaBloc>(() => _i53.NoticiaBloc(
          gh<_i51.GetNewsUseCase>(),
          gh<_i21.AddFavsNewsUseCase>(),
          gh<_i21.ClearAllFavsNewsUseCase>(),
          gh<_i21.ClearFavsNewsUseCase>(),
          gh<_i21.GetFavsNewsUseCase>(),
          gh<_i50.GetNewsCategoryUseCase>(),
          gh<_i30.LocalStorage>(),
        ));
    gh.factory<_i54.PlayMusicBloc>(() => _i54.PlayMusicBloc(
          gh<_i49.GetMusicUseCase>(),
          gh<_i48.GetMusicCategoryUseCase>(),
        ));
    gh.factory<_i55.AgendaBloc>(() => _i55.AgendaBloc(
          gh<_i27.GetAgendaNewsUseCase>(),
          gh<_i9.GetAgendaFavsNewsUseCase>(),
          gh<_i9.AddAgendaFavsNewsUseCase>(),
          gh<_i9.ClearAgendaFavsNewsUseCase>(),
          gh<_i9.ClearAllFavsNewsUseCase>(),
          gh<_i46.GetLocalidadesUseCase>(),
          gh<_i26.GetAgendaCategoriesUseCase>(),
          gh<_i44.AddAgendaSugerenciasUsecase>(),
          gh<_i47.GetLugaresUseCase>(),
        ));
    return this;
  }
}

class _$InjectableResources extends _i56.InjectableResources {}
