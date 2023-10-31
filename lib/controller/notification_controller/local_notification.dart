import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings("flutter_logo");

    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (detail) async {},
    );
  }

  Future<void> simpleNotificationShow(String tiltle, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("Channel_id", "Channel_title",
            priority: Priority.high,
            importance: Importance.max,
            icon: "flutter_logo",
            largeIcon: DrawableResourceAndroidBitmap("flutter_logo"),
            channelShowBadge: true);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await _notificationsPlugin.show(0, tiltle, body, notificationDetails);
  }

  Future<void> bigPictureNotificationShow(String tiltle, String body) async {
    BigPictureStyleInformation bigPictureStyleInformation =
        const BigPictureStyleInformation(
            DrawableResourceAndroidBitmap("flutter_logo"),
            contentTitle: "Code_Complete",
            largeIcon: DrawableResourceAndroidBitmap("flutter_logo"));

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("big_picture_id", "big_picture_title",
            priority: Priority.high,
            importance: Importance.max,
            styleInformation: bigPictureStyleInformation);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await _notificationsPlugin.show(0, tiltle, body, notificationDetails);
  }

  Future<void> multipleNotificationShow(List<List<String>> messages) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("Channel_id", "Channel_title",
            priority: Priority.high,
            importance: Importance.max,
            groupKey: "commonMessage");

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    for (int i = 0; i < messages.length; i++) {
      Future.delayed(
        const Duration(milliseconds: 1000),
        () {
          _notificationsPlugin.show(
              i, messages[i][0], messages[i][1], notificationDetails);
        },
      );
    }
  }

  Future<void> multipleHideNotificationShow(List<String> messages) async {
    InboxStyleInformation inboxStyleInformation =
        InboxStyleInformation(messages, summaryText: "List notifications");

    AndroidNotificationDetails androidNotificationSpecific =
        AndroidNotificationDetails("groupChennelId", "groupChennelTitle",
            styleInformation: inboxStyleInformation,
            groupKey: "commonMessage",
            setAsGroupSummary: true);

    NotificationDetails platformChannelSpe =
        NotificationDetails(android: androidNotificationSpecific);

    _notificationsPlugin.show(0, "Attention",
        "You have ${messages.length} messages", platformChannelSpe);
  }

  Future<void> multipleInListNotificationShow(
      List<List<String>> messages) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("Channel_id", "Channel_title",
            priority: Priority.high,
            importance: Importance.max,
            groupKey: "commonMessage");

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    for (int i = 0; i < messages.length; i++) {
      Future.delayed(
        const Duration(milliseconds: 1000),
        () {
          _notificationsPlugin.show(
              i, messages[i][0], messages[i][1], notificationDetails);
        },
      );

      List<String> lines = [];

      InboxStyleInformation inboxStyleInformation =
          InboxStyleInformation(lines, summaryText: "List notifications");

      AndroidNotificationDetails androidNotificationSpecific =
          AndroidNotificationDetails("groupChennelId", "groupChennelTitle",
              styleInformation: inboxStyleInformation,
              groupKey: "commonMessage",
              setAsGroupSummary: true);

      NotificationDetails platformChannelSpe =
          NotificationDetails(android: androidNotificationSpecific);

      _notificationsPlugin.show(3, "Attention",
          "You Have ${lines.length} messages", platformChannelSpe);
    }
  }
}
