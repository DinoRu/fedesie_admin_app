
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FCMController extends GetxController {

  FirebaseMessaging messaging = FirebaseMessaging.instance;


  @override
  void onInit() async {
    await initFirebaseMessaging();
    super.onInit();
  }

  Future<void> initFirebaseMessaging() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackground);
  }

  Future<void> _firebaseMessagingBackground(RemoteMessage message) async {
      print('Notifiication: ${message.notification?.title} - ${message.notification?.body}');
  }
}

