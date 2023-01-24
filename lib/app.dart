import 'package:Lakshore/app/data/profile.dart';

import 'app/data/login_response.dart';

abstract class App{
  static String token = '';
  static User user = User(profilepic:ProfileList.last.profilePic.toString() );
}