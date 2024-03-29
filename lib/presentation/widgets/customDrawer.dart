// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:example/presentation/pages/chat/bloc/chat_bloc.dart';
// import 'package:example/presentation/pages/chat/chat_page.dart';
// import 'package:example/presentation/pages/contacta.dart';
// import 'package:example/presentation/pages/noticias/noticia_page.dart';
// import 'package:example/presentation/pages/quienes_somos.dart';
// import 'package:example/presentation/pages/terminos_y_condiciones.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher_string.dart';

// import '../blocs/notifications/notifications_bloc.dart';
// import '../blocs/theme/theme_bloc.dart';
// import '../pages/agenda/bloc/agenda_bloc.dart';

// class CustomDrawer extends StatelessWidget {
//   const CustomDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const colorizeColors = [
//       Colors.purple,
//       Colors.blue,
//       Colors.yellow,
//       Colors.green,
//     ];

//     const colorizeTextStyle = TextStyle(
//       fontSize: 25.0,
//       fontFamily: 'Horizon',
//     );
//     const colorizeTextStyle2 = TextStyle(
//       fontSize: 25.0,
//       fontFamily: 'Horizon',
//     );
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double drawerWidth = screenWidth * 0.85;

//     return SizedBox(
//       width: drawerWidth,
//       child: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             const DrawerHeader(
//                 colorizeTextStyle: colorizeTextStyle,
//                 colorizeColors: colorizeColors,
//                 colorizeTextStyle2: colorizeTextStyle2),
//             Container(
//               margin: const EdgeInsets.only(
//                   top: 10, bottom: 20, left: 10, right: 10),
//               child: _buildSocialIconsRow(),
//             ),
//             const Center(
//                 child: Text(
//               "Configurar notificaciones móviles",
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//             )),
//             const Divider(thickness: 0.5),
//             ListTile(
//               leading: const Icon(
//                 FontAwesomeIcons.bell,
//                 color: Colors.purple,
//               ),
//               title: const Text(
//                 'Activar Notificaciones',
//                 style: TextStyle(fontSize: 12),
//               ),
//               trailing: BlocBuilder<NotificationsBloc, NotificationsState>(
//                 builder: (context, state) {
//                   return Switch(
//                     value: state.notificationsStateData.estaAutorizado ?? false,
//                     onChanged: (value) {
//                       BlocProvider.of<NotificationsBloc>(context)
//                           .add(SwitchPermissionEvent());
//                     },
//                   );
//                 },
//               ),
//             ),
//             const Divider(thickness: 0.5),
//             const Center(
//                 child: Text(
//               "Conocenos",
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//             )),
//             const Divider(thickness: 0.5),
//             BlocBuilder<ThemeBloc, ThemeState>(
//               builder: (context, state) {
//                 return ListTile(
//                   leading: !state.themeStateData.lightTheme!
//                       ? Icon(
//                           FontAwesomeIcons.sun,
//                           color: Colors.yellow.shade100,
//                         )
//                       : const Icon(
//                           FontAwesomeIcons.moon,
//                           color: Colors.purple,
//                         ),
//                   title: !state.themeStateData.lightTheme!
//                       ? const Text(
//                           'Light Theme',
//                           style: TextStyle(fontSize: 12),
//                         )
//                       : const Text(
//                           "Dark Theme",
//                           style: TextStyle(fontSize: 12),
//                         ),
//                   trailing: BlocBuilder<ThemeBloc, ThemeState>(
//                     builder: (context, state) {
//                       return Switch(
//                         value: state.themeStateData.lightTheme!,
//                         onChanged: (value) {
//                           BlocProvider.of<ThemeBloc>(context)
//                               .add(ChangeThemeEvent(value));
//                         },
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//             const Divider(),
//             ListTile(
//               title: const Text(
//                 'Quienes somos',
//                 style: TextStyle(fontSize: 12),
//               ),
//               trailing: const Icon(
//                 Icons.arrow_forward_ios_sharp,
//                 color: Colors.deepPurple,
//                 size: 16,
//               ),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const QuienesSomos()));
//               },
//             ),
//             const Divider(thickness: 0.5),
//             ListTile(
//               title: const Text(
//                 'Contacta',
//                 style: TextStyle(fontSize: 12),
//               ),
//               trailing: const Icon(
//                 Icons.arrow_forward_ios_sharp,
//                 color: Colors.deepPurple,
//                 size: 16,
//               ),
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => const Contacta()));
//               },
//             ),
//             const Divider(thickness: 0.5),
//             ListTile(
//               title: const Text(
//                 'Anúnciate en Castellón365Events',
//                 style: TextStyle(fontSize: 12),
//               ),
//               trailing: const Icon(
//                 Icons.arrow_forward_ios_sharp,
//                 color: Colors.deepPurple,
//                 size: 16,
//               ),
//               onTap: () {
//                 launchUrlString(
//                     "https://issuu.com/castellon365events/docs/presentation.pptx");
//               },
//             ),
//             const Divider(thickness: 0.5),
//             ListTile(
//               title: const Text(
//                 'Términos y condiciones',
//                 style: TextStyle(fontSize: 12),
//               ),
//               trailing: const Icon(
//                 Icons.arrow_forward_ios_sharp,
//                 color: Colors.deepPurple,
//                 size: 16,
//               ),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const TerminosYcondiciones()));
//               },
//             ),
//             ListTile(
//               title: const Text(
//                 'Habla con Simon',
//                 style: TextStyle(fontSize: 12),
//               ),
//               trailing: const Icon(
//                 FontAwesomeIcons.robot,
//                 color: Colors.deepPurple,
//                 size: 16,
//               ),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (_) => BlocProvider.value(
//                           value: BlocProvider.of<ChatBloc>(context),
//                           child: const ChatPage())),
//                 );
//               },
//             ),
//             const Divider(thickness: 0.5),
//             const Center(
//                 child: Text(
//               "¿No encuentras el evento que buscas?",
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//             )),
//             Container(
//               margin: const EdgeInsets.only(
//                   bottom: 10, top: 10, right: 25, left: 25), // Margen
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) => BlocProvider.value(
//                               value: BlocProvider.of<AgendaBloc>(context),
//                               child:
//                                   const NoticiasPage())) //todo : const SuggestEventScreen())),
//                       );
//                 },
//                 style: TextButton.styleFrom(
//                   foregroundColor: Colors.deepPurple.shade500,
//                   backgroundColor: Colors.deepPurple.shade50, // Color del fondo
//                   side: BorderSide(
//                       color: Colors.deepPurple.shade500, width: 0.5), // Borde
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 16, vertical: 8), // Espaciado interno
//                   shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.zero),
//                 ),
//                 child: const Text("SUGIERE UN EVENTO"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DrawerHeader extends StatelessWidget {
//   const DrawerHeader({
//     super.key,
//     required this.colorizeTextStyle,
//     required this.colorizeColors,
//     required this.colorizeTextStyle2,
//   });

//   final TextStyle colorizeTextStyle;
//   final List<MaterialColor> colorizeColors;
//   final TextStyle colorizeTextStyle2;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//         children: [
//           Container(
//             color: Colors.black,
//             height: 150,
//             width: double.infinity,
//             child: Container(
//               margin: const EdgeInsets.only(top: 50),
//               child: AnimatedTextKit(
//                 animatedTexts: [
//                   ColorizeAnimatedText('Castellón365Events',
//                       textStyle: colorizeTextStyle,
//                       colors: colorizeColors,
//                       textAlign: TextAlign.center),
//                   ColorizeAnimatedText(
//                     'Descubre lo que pasa en Castellón',
//                     textStyle: colorizeTextStyle2,
//                     colors: colorizeColors,
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//                 isRepeatingAnimation: false,
//                 onTap: () {
//                   print("Tap Event");
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget _buildSocialIconsRow() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: [
//       GestureDetector(
//         child: const CircleAvatar(
//           backgroundColor: Colors.black,
//           child: Icon(
//             FontAwesomeIcons.facebookF,
//             color: Colors.white,
//             size: 20,
//           ),
//         ),
//         onTap: () => launchUrlString("https://facebook.com"),
//       ),
//       GestureDetector(
//         child: const CircleAvatar(
//           backgroundColor: Colors.black,
//           child:
//               Icon(FontAwesomeIcons.instagram, color: Colors.white, size: 20),
//         ),
//         onTap: () => launchUrlString("https://instagram.com"),
//       ),
//       GestureDetector(
//         child: const CircleAvatar(
//           backgroundColor: Colors.black,
//           child: Icon(FontAwesomeIcons.twitter, color: Colors.white, size: 20),
//         ),
//         onTap: () => launchUrlString("https://twitter.com/nomepierdoniuna"),
//       ),
//       GestureDetector(
//         child: const CircleAvatar(
//           backgroundColor: Colors.black,
//           child: Icon(FontAwesomeIcons.youtube, color: Colors.white, size: 20),
//         ),
//         onTap: () => launchUrlString("https://youtube.com/@nmpnutv"),
//       ),
//       GestureDetector(
//         child: const CircleAvatar(
//           backgroundColor: Colors.black,
//           child: Icon(FontAwesomeIcons.spotify, color: Colors.white, size: 20),
//         ),
//         onTap: () => launchUrlString(
//             "https://open.spotify.com/playlist/72zNN6FOxq8kcbFpgmrTfj"),
//       ),
//     ],
//   );
// }
