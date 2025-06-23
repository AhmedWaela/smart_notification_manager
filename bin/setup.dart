import 'package:smart_notification_manager/core/android_setup/add_desugaring_dependency.dart';
import 'package:smart_notification_manager/core/android_setup/add_forground_service.dart';
import 'package:smart_notification_manager/core/android_setup/add_full_screen_configuration.dart';
import 'package:smart_notification_manager/core/android_setup/add_notification_actions.dart';
import 'package:smart_notification_manager/core/android_setup/add_window_manager_dependency.dart';
import 'package:smart_notification_manager/core/android_setup/check_and_update_gradle_version.dart';
import 'package:smart_notification_manager/core/android_setup/enable_desugaring_library.dart';
import 'package:smart_notification_manager/core/android_setup/enable_multi_dex.dart';
import 'package:smart_notification_manager/core/android_setup/add_schedule_notification_configuration.dart';
import 'package:smart_notification_manager/core/android_setup/ignore_do_not_disturb_mode.dart';
import 'package:smart_notification_manager/core/android_setup/setup_notification_sound.dart';
import 'package:smart_notification_manager/core/android_setup/update_compile_sdk.dart';

void main() {
  enableMultiDex();
  enableCoreLibraryDesugaring();
  addCoreLibraryDesugaringDependency();
  checkAndUpdateGradleVersion();
  addWindowManagerLibrary();
  updateCompileSdk();
  addScheduleNotificationConfiguration();
  addFullScreenNotificationsConfig();
  addNotificationAction();
  useForegroundService();
  ignoreDontDistrubMode();
  setupNotificationSound();
}
