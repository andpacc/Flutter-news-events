import 'dart:async';

import 'package:example/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
}

@injectable
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationsStateData get notificationState => state.notificationsStateData;
  NotificationsBloc() : super(const NotificationsInitialState()) {
    on<SwitchPermissionEvent>(_switchPermission);
    _onForegroundMessage();
  }

  static Future<void> initializeFirebaseNotifications() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  FutureOr<void> _getFirebaseToken() async {
    if (notificationState.status != AuthorizationStatus.authorized) return;
    await messaging.getToken();
  }

  Future<bool> requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    _getFirebaseToken();
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  FutureOr<void> _switchPermission(
      SwitchPermissionEvent event, Emitter<NotificationsState> emit) async {
    bool granted = false;

    if (notificationState.estaAutorizado == false) {
      granted = await requestPermission();
    }
    emit(NotificationsLoadedState(
        notificationsStateData: notificationState.copyWith(
            estaAutorizado: granted,
            status: granted
                ? AuthorizationStatus.authorized
                : AuthorizationStatus.denied)));
    _getFirebaseToken();
    print(
        '''estaAutorizado: ${notificationState.estaAutorizado}----${notificationState.status}''');
  }

  FutureOr<void> _handleRemoteMessage(RemoteMessage message) async {
    print("Messsage data:$message.data");
    if (message.notification == null) return;
    print(message.notification);
  }

  FutureOr<void> _onForegroundMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (notificationState.estaAutorizado == true) {
        _handleRemoteMessage(message);
      }
    });
  }
}
