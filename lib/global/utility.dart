// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class UserDataManager {
  static const String jwtTokenKey = 'jwt_token';
  static const String roleKey = 'role';
  static const String nameKey = 'name';
  static const String emailKey = 'email';
  static const String uidKey = 'uid';

  static const String companyIdKey = 'companyId';
  static const String companyNameKey = 'companyName';
  static const String customerIdKey = 'customerId';

  static Future<void> saveLoginInfo(
    String jwtToken,
    String role,
    String name,
    String email,
    String uid,
    String companyId,
    String companyName,
    String customerId,
  ) async {
    Map<String, String> userData = {
      jwtTokenKey: jwtToken,
      roleKey: role,
      uidKey: uid,
      nameKey: name,
      emailKey: email,
      companyIdKey: companyId,
      companyNameKey: companyName,
      customerIdKey: customerId,
    };

    SharedPreferences prefs = await SharedPreferences.getInstance();
    userData.forEach((key, value) {
      prefs.setString(key, value);
      // print('Saved $key: $value'); // Add this line for debug
    });
  }

  static Future<Map<String, String>> getLoginInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'jwtToken': prefs.getString(jwtTokenKey) ?? '',
      'role': prefs.getString(roleKey) ?? '',
      'name': prefs.getString(nameKey) ?? '',
      'email': prefs.getString(emailKey) ?? '',
      'uid': prefs.getString(uidKey) ?? '',
      'companyId': prefs.getString(companyIdKey) ?? '',
      'companyName': prefs.getString(companyNameKey) ?? '',
      'customerId': prefs.getString(customerIdKey) ?? '',
    };
  }

  static Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(jwtTokenKey);
    await prefs.remove(roleKey);
    await prefs.remove(nameKey);
    await prefs.remove(emailKey);
    await prefs.remove(uidKey);
    await prefs.remove(companyIdKey);
    await prefs.remove(customerIdKey);
  }
}