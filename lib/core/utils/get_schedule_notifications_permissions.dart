List<String> getScheduleNotificationsPermissions() {
  List<String> permissions = [
    '<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>',
    '<uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM" />',
    '<uses-permission android:name="android.permission.USE_EXACT_ALARM" />',
  ];
  return permissions;
}