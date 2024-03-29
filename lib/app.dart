// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:convenient_test/convenient_test.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:example/presentation/blocs/notifications/notifications_bloc.dart';
import 'package:example/presentation/blocs/theme/theme_bloc.dart';
import 'package:example/presentation/pages/agenda/bloc/agenda_bloc.dart';
import 'package:example/presentation/pages/chat/bloc/chat_bloc.dart';
import 'package:example/presentation/pages/maps/bloc/map_bloc.dart';
import 'package:example/presentation/pages/noticias/bloc/noticias_bloc.dart';
import 'package:example/presentation/pages/play/music_play/music_bloc/play_music_bloc.dart';
import 'package:example/presentation/pages/play/video_play/video_bloc/play_video_bloc.dart';
import 'package:example/presentation/utils/app_themes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:url_strategy/url_strategy.dart';

import 'data/data_constants.dart';
import 'di/dependecy_injector.dart' as di;
import 'di/dependecy_injector.dart';
import 'domain/entities/models/agenda.dart';
import 'domain/entities/models/titular.dart';
import 'generated/l10n.dart';
import 'presentation/utils/app_route_provider.dart';

//@deeplink_import

launch(ApiConfiguration apiConfiguration) async {
  ///This is required for fix the position if not null exception will appier
  WidgetsFlutterBinding.ensureInitialized();

  ///Dependecy injector inicialize
  await configureDependencies(apiConfiguration.entorno);

  await di.sl.allReady();

  ///Fixed the rotation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  //Change this line if is required for your app
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
  if (!kIsWeb) {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
  }

  Hive.registerAdapter<Agenda>(AgendaAdapter());
  Hive.registerAdapter<Titular>(TitularAdapter());

  await NotificationsBloc.initializeFirebaseNotifications();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  setPathUrlStrategy();
  await dotenv.load(fileName: ".env");
  OpenAI.apiKey = dotenv.env['OPEN_AI_API_KEY']!;
  runApp(const MyApp());
}

//Change the name of the class for the name: Example: TemplateApp
class MyApp extends StatefulWidget {
  //@deeplink_class_parameter: onGenerateInitalRoutes must be inicialice here
  const MyApp({
    super.key,
    //@deeplink_constructor
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    //@deeplinkStructure: if deeplink option is choose code must be insert here
  }

  @override
  Widget build(BuildContext context) {
    return const _App();
  }
}

class _App extends StatelessWidget {
  const _App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc()..add(InitializedThemeEvent()),
        ),
        BlocProvider(
          create: (context) => sl<AgendaBloc>()..add(InitializedAgendaEvent()),
        ),
        BlocProvider(
          create: (context) =>
              sl<NoticiaBloc>()..add(InitializeNoticiasEvent()),
        ),
        BlocProvider(
          create: (context) => sl<PlayMusicBloc>()..add(InitializeMusicEvent()),
        ),
        BlocProvider(
          create: (context) => sl<PlayVideoBloc>()..add(InitializeVideoEvent()),
        ),
        BlocProvider(
          create: (context) => sl<NotificationsBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<MapBloc>()..add(InitializedMapEvent()),
        ),
        BlocProvider(
          create: (context) => sl<ChatBloc>()..add(InitializedChatEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return ConvenientTestWrapperWidget(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouteProvider.router,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: state.themeStateData.lightTheme!
                  ? ThemeMode.dark
                  : ThemeMode.light,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: 'NewsAndEvents',
            ),
          );
        },
      ),
    );
  }
}
