part of 'notifications_bloc.dart';

abstract class NotificationsEvent {}

class SwitchPermissionEvent extends NotificationsEvent {
  SwitchPermissionEvent();
}

class DeactivateNotificationsEvent extends NotificationsEvent {}

class NotificationInitialEvent extends NotificationsEvent {}
