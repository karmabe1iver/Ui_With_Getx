import 'package:get_storage/get_storage.dart';

import '../../app.dart';
import '../data/login_response.dart';

abstract class LocalStore {
  final box = GetStorage();

  static void loginData(String key, dynamic value) =>
      GetStorage().write(key, value);

  static void setData(String key, dynamic value) =>
      GetStorage().write(key, value);

  static int? getInt(String key) => GetStorage().read(key);

  static String? getString(String key) => GetStorage().read(key);

  static bool? getBool(String key) => GetStorage().read(key);

  static double? getDouble(String key) => GetStorage().read(key);

  static dynamic getData(String key) => GetStorage().read(key);

  static void clearData() async => GetStorage().erase();
}

class FetchDataFromLocalStore {
  userData() async {
    App.user = User(
      profilepic: LocalStore.getData('photo'),
      userid: LocalStore.getInt('user_id'),
      token: LocalStore.getString('token'),
      firstname: LocalStore.getString('user_firstname'),
      lastname: LocalStore.getString('user_lastname'),
      emailVerified: LocalStore.getBool('user_email_verified'),
      twoFactorRequired: LocalStore.getBool('user_two_factor_required'),
      rolename: LocalStore.getString('user_rolename'),
      custid: LocalStore.getInt('user_cust_id'),
      custname: LocalStore.getString('user_cust_name'),
      username: LocalStore.getString('user_name'),
      roleid: LocalStore.getInt('user_role_id'),
      root: LocalStore.getBool('user_root'),
    );
    App.token = LocalStore.getString('token') ?? '';
  }
}
