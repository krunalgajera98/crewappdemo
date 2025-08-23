import 'package:appcrewdemo/crewappdemo/features/empiric_task/presentation/pages/emp_task_page.dart';
import 'package:appcrewdemo/crewappdemo/features/home/presentation/pages/home_page.dart';
import 'package:appcrewdemo/crewappdemo/features/login/presentation/pages/login_page.dart';
import 'package:appcrewdemo/crewappdemo/features/login/presentation/pages/registration_page.dart';
import 'package:get/get.dart';

import '../../features/splash/presentation/page/splash_screen.dart';

class Routes {
  static const login = '/login';
  static const registrationPage = '/registrationPage';
  static const home = '/home';
  static const splash = '/splashScreen';
  static const empDemo = '/empDemo';

}

List<GetPage<dynamic>>? getPages = [
  GetPage(name: Routes.login, page: () => LoginPage(), transition: Transition.fadeIn),
  GetPage(name: Routes.registrationPage, page: () => RegistrationPage(), transition: Transition.fadeIn),
  GetPage(name: Routes.home, page: () => HomePage(), transition: Transition.fadeIn),
  GetPage(name: Routes.splash, page: () => SplashScreen(), transition: Transition.fadeIn),
  GetPage(name: Routes.empDemo, page: () => EmpiricPage(), transition: Transition.fadeIn),
];
