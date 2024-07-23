
// class FcmManager {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   FcmManager() {
//     createFirebaseInstance();
//     getPermission();
//   }

//   Future<void> getPermission() async {
//     var settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       await FlutterNotificationChannel.registerNotificationChannel(
//         description: 'Your channel description',
//         id: 'dep_notification_channel',
//         importance: NotificationImportance.IMPORTANCE_HIGH,
//         name: 'Dep notification channel',
//         visibility: NotificationVisibility.VISIBILITY_PUBLIC,
//         allowBubbles: true,
//         enableVibration: true,
//         enableSound: true,
//         showBadge: true,
//       );
//     }
//   }

//   Future<String> getToken() async {
//     if (kIsWeb) {
//       return await messaging.getToken(
//               vapidKey:
//                   "BCJZFJMudEHgNZiMb1L32iWyefdn2laSprh0_-rtQ-t86JbyTSkRSotOmL28qNa5N90OIsdT8d8KV_JvXTFysaI") ??
//           "";
//     } else {
//       return await messaging.getToken() ?? "";
//     }
//   }

//   void getMessages(BuildContext context) {
//     /// aşağıdaki kod uygulama açıkken bir bildirim gelirse çalışıyor.
//     // FirebaseMessaging.onMessage.listen((event) => _handleMessage(event, "onMessage"));
//     FirebaseMessaging.onMessageOpenedApp
//         .listen((event) => _handleMessage(event, context));
//   }

//   void _handleMessage(RemoteMessage message, BuildContext context) {
//     NotificationNavigation()
//         .navigateAccordingToNotification(message.data, context);
//   }

//   Future<void> createFirebaseInstance() async {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//   }
// }
