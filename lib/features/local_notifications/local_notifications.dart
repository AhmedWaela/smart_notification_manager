import "package:flutter_local_notifications/flutter_local_notifications.dart";
import "package:smart_notification_manager/enums/enums.dart";
import "package:smart_notification_manager/features/local_notifications/build_initalization_settings.dart";
import "package:smart_notification_manager/features/local_notifications/models/local_notifications_config.dart";

abstract class NotificationSetup {
  Future<void> setup({
    LocalNotificationConfig config = const LocalNotificationConfig(),
  });
  factory NotificationSetup.fromType(NotificationType type) {
    switch (type) {
      case NotificationType.local:
        return LocalNotificationSetup._();
      case NotificationType.push:
        return PushNotificationSetup._();
    }
  }
}

class LocalNotificationSetup implements NotificationSetup {
  const LocalNotificationSetup._();
  static final _plugin = FlutterLocalNotificationsPlugin();
  static Function(NotificationResponse details)? _onBackgroundTap;
  static Function(NotificationResponse details)? _onForegroundTap;
  @override
  Future<void> setup({
    LocalNotificationConfig config = const LocalNotificationConfig(),
  }) async {
    _onBackgroundTap = config.onBackgroundTap;
    _onForegroundTap = config.onForegroundTap;
    await _plugin.initialize(
      buildInitalizationSettings(config: config),
      onDidReceiveBackgroundNotificationResponse: onDidReceiveBackgroundNotificationResponse,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  static void onDidReceiveBackgroundNotificationResponse(
    NotificationResponse details,
  ) {
    _onBackgroundTap?.call(details);
  }

  static void onDidReceiveNotificationResponse(NotificationResponse details) {
     _onForegroundTap?.call(details);
  }
}

class PushNotificationSetup implements NotificationSetup {
  const PushNotificationSetup._();
  @override
  Future<void> setup({
    LocalNotificationConfig config = const LocalNotificationConfig(),
  }) async {}
}
