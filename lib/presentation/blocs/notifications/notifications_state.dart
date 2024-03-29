part of 'notifications_bloc.dart';

class NotificationsStateData {
  final AuthorizationStatus status;
  final bool? estaAutorizado;

  const NotificationsStateData(
      {this.status = AuthorizationStatus.notDetermined, this.estaAutorizado});

  NotificationsStateData copyWith(
      {AuthorizationStatus? status, bool? estaAutorizado}) {
    return NotificationsStateData(
        status: status ?? this.status,
        estaAutorizado: estaAutorizado ?? this.estaAutorizado);
  }
}

@immutable
abstract class NotificationsState {
  final NotificationsStateData notificationsStateData;

  const NotificationsState({required this.notificationsStateData});
}

class NotificationsInitialState extends NotificationsState {
  const NotificationsInitialState(
      {super.notificationsStateData = const NotificationsStateData()});
}

class NotificationsLoadedState extends NotificationsState {
  const NotificationsLoadedState({required super.notificationsStateData});
}
