import 'package:get/get.dart';


import '../../utils/services/local_storage/flutter_secure_storage.dart';
import '../controllers/network_controller.dart';
String? userid;
class DependencyInjection {
  static Future<void> init() async {
    Get.put<NetworkController>(NetworkController(),permanent:true);
    userid = await PersistentStorage.read('useridString');
  }
}