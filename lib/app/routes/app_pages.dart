import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/forget_password/bindings/forget_password_binding.dart';
import '../modules/forget_password/views/forget_password_view.dart';
import '../modules/leave_request/bindings/leave_request_binding.dart';
import '../modules/leave_request/views/leave_request_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my_leaves/bindings/my_leaves_binding.dart';
import '../modules/my_leaves/views/my_leaves_view.dart';
import '../modules/my_shift/bindings/my_shift_binding.dart';
import '../modules/my_shift/views/my_shift_view.dart';
import '../modules/notice_board/bindings/notice_board_binding.dart';
import '../modules/notice_board/views/notice_board_view.dart';
import '../modules/profiledetails/bindings/profiledetails_binding.dart';
import '../modules/profiledetails/views/profiledetails_view.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/updationrequest/bindings/updationrequest_binding.dart';
import '../modules/updationrequest/views/updationrequest_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreen(),
      // binding: SplashBinding(),
    ),
    GetPage(
        name: _Paths.LOGIN,
        page: () => const LoginView(),
        binding: LoginBinding(),
        transition: Transition.downToUp,
        transitionDuration: Duration(milliseconds: 50)),
    GetPage(
        name: _Paths.FORGET_PASSWORD,
        page: () => const ForgetPasswordView(),
        binding: ForgetPasswordBinding(),
        transition: Transition.downToUp,
        transitionDuration: Duration(milliseconds: 3)),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
      transition: Transition.cupertinoDialog,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: _Paths.MY_LEAVES,
      page: () => const MyLeavesView(),
      binding: MyLeavesBinding(),
      transition: Transition.cupertinoDialog,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: _Paths.MY_SHIFT,
      page: () => const MyShiftView(),
      binding: MyShiftBinding(),
      transition: Transition.cupertinoDialog,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: _Paths.NOTICE_BOARD,
      page: () => const NoticeBoardView(),
      binding: NoticeBoardBinding(),
      transition: Transition.cupertinoDialog,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: _Paths.LEAVE_REQUEST,
      page: () => const LeaveRequestView(),
      binding: LeaveRequestBinding(),
      transition: Transition.cupertinoDialog,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: _Paths.PROFILEDETAILS,
      page: () => ProfiledetailsView(),
      binding: ProfiledetailsBinding(),
      transition: Transition.cupertinoDialog,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: _Paths.UPDATIONREQUEST,
      page: () => const UpdationrequestView(),
      binding: UpdationrequestBinding(),
      transition: Transition.noTransition,
      transitionDuration: Duration(seconds: 1),
    ),
  ];
}
