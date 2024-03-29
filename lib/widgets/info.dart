import 'package:example/di/dependecy_injector.dart';
import 'package:example/presentation/blocs/notifications/notifications_bloc.dart';
import 'package:example/presentation/blocs/theme/theme_bloc.dart';
import 'package:example/presentation/utils/app_routes.dart';
import 'package:example/presentation/utils/app_themes.dart';
import 'package:example/widgets/contacta.dart';
import 'package:example/widgets/quienes_somos.dart';
import 'package:example/widgets/terminos_y_condiciones.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double circleRadius = 60.0;
    const double fontSize = 22.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Más info"),
        centerTitle: false,
      ),
      body: BlocProvider(
        create: (context) => sl<NotificationsBloc>(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomCircleAvatar(
                  circleRadius: circleRadius, fontSize: fontSize),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: Text("Descubre lo que pasa en castellón")),
              ),
              buildSocialIconsRow(),
              const Center(
                  child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Configurar notificaciones móviles",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              )),
              const Divider(thickness: 0.5),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.bell,
                  color: primaryColor(context),
                ),
                title: const Text(
                  'Activar Notificaciones',
                  style: TextStyle(fontSize: 12),
                ),
                trailing: BlocBuilder<NotificationsBloc, NotificationsState>(
                  builder: (context, state) {
                    return Switch(
                      value:
                          state.notificationsStateData.estaAutorizado ?? false,
                      onChanged: (value) {
                        BlocProvider.of<NotificationsBloc>(context)
                            .add(SwitchPermissionEvent());
                      },
                    );
                  },
                ),
              ),
              const Divider(thickness: 0.5),
              const Center(
                  child: Text(
                "Conocenos",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )),
              const Divider(thickness: 0.5),
              BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return ListTile(
                    leading: !state.themeStateData.lightTheme!
                        ? Icon(
                            FontAwesomeIcons.sun,
                            color: Colors.yellow.shade100,
                          )
                        : Icon(
                            FontAwesomeIcons.moon,
                            color: primaryColor(context),
                          ),
                    title: !state.themeStateData.lightTheme!
                        ? const Text(
                            'Light Theme',
                            style: TextStyle(fontSize: 12),
                          )
                        : const Text("Dark Theme"),
                    trailing: BlocBuilder<ThemeBloc, ThemeState>(
                      builder: (context, state) {
                        return Switch(
                          value: state.themeStateData.lightTheme!,
                          onChanged: (value) {
                            BlocProvider.of<ThemeBloc>(context)
                                .add(ChangeThemeEvent(value));
                          },
                        );
                      },
                    ),
                  );
                },
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  'Quienes somos',
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: primaryColor(context),
                  size: 16,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuienesSomos()));
                },
              ),
              const Divider(thickness: 0.5),
              ListTile(
                title: const Text(
                  'Contacta',
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: primaryColor(context),
                  size: 16,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Contacta()));
                },
              ),
              const Divider(thickness: 0.5),
              ListTile(
                title: const Text(
                  'Anúnciate en Castellón365Events',
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: primaryColor(context),
                  size: 16,
                ),
                onTap: () {
                  launchUrlString(
                      "https://issuu.com/castellon365events/docs/presentation.pptx");
                },
              ),
              const Divider(thickness: 0.5),
              ListTile(
                title: const Text(
                  'Términos y condiciones',
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: primaryColor(context),
                  size: 16,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TerminosYcondiciones()));
                },
              ),
              ListTile(
                title: const Text(
                  'Habla con Simon',
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Icon(
                  FontAwesomeIcons.robot,
                  color: primaryColor(context),
                  size: 16,
                ),
                onTap: () {
                  //TODO: NAVEGAR A CHAT PAGE
                  GoRouter.of(context).push("${AppRoutes.infoPage.path}/chat");
                },
              ),
              const Divider(thickness: 0.5),
              const Center(
                  child: Text(
                "¿No encuentras el evento que buscas?",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )),
              Container(
                margin: const EdgeInsets.only(
                    bottom: 10, top: 10, right: 25, left: 25),
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context)
                        .push("${AppRoutes.infoPage.path}/suggestions");
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: primaryColor(context),
                    side: BorderSide(color: primaryColor(context), width: 0.5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                  ),
                  child: const Text("SUGIERE UN EVENTO"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required this.circleRadius,
    required this.fontSize,
  });

  final double circleRadius;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Center(
        child: CircleAvatar(
          radius: circleRadius,
          backgroundColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  const TextSpan(text: "no "),
                  TextSpan(
                      text: "me",
                      style: TextStyle(color: primaryColor(context))),
                  const TextSpan(text: "\npierdo\n"),
                  TextSpan(
                      text: "ni",
                      style: TextStyle(color: primaryColor(context))),
                  const TextSpan(text: " una"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildSocialIconsRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(
            FontAwesomeIcons.facebookF,
            color: Colors.white,
            size: 20,
          ),
        ),
        onTap: () => launchUrlString("https://facebook.com"),
      ),
      GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.black,
          child:
              Icon(FontAwesomeIcons.instagram, color: Colors.white, size: 20),
        ),
        onTap: () => launchUrlString("https://instagram.com"),
      ),
      GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(FontAwesomeIcons.twitter, color: Colors.white, size: 20),
        ),
        onTap: () => launchUrlString("https://twitter.com/nomepierdoniuna"),
      ),
      GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(FontAwesomeIcons.youtube, color: Colors.white, size: 20),
        ),
        onTap: () => launchUrlString("https://youtube.com/@nmpnutv"),
      ),
      GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(FontAwesomeIcons.spotify, color: Colors.white, size: 20),
        ),
        onTap: () => launchUrlString(
            "https://open.spotify.com/playlist/72zNN6FOxq8kcbFpgmrTfj"),
      ),
    ],
  );
}
