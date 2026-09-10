import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PersistentStorage {
  static const _box = FlutterSecureStorage();

  // Read data from storage
  static Future<String?> read(String key) async {
    return await _box.read(key: key);
  }

  // Write data to storage
  static Future<void> write(String key, String? value) async {
    await _box.write(key: key, value: value);
  }


  // Remove data from storage
  static Future<void> remove(String key) async {
    await _box.delete(key: key);
  }

  static Future<void> removeAll() async{
    await  _box.deleteAll();
  }


}



