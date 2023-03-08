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
    App.User = Datum(
      employeeId: LocalStore.getData('Emp_id'),
      name: LocalStore.getData('user_name'),
      siklBal: LocalStore.getData('sic_bal'),
      plBal: LocalStore.getData('pl_bal'),
      clBal: LocalStore.getData('Cl_bal'),
    );
   // App.token = LocalStore.getString('token
   // '
   // )
   // ??
   // '
    //';
  }
}
