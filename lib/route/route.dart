import 'package:get/get.dart';

import '../controller/home_page_controller.dart';
import '../view/screens/SignUpScreen/sign_up_screen.dart';
import '../view/screens/loginScreen/loign_screen.dart';
import '../view/screens/mainPage/main_page.dart';

List<GetPage> pageRoute = [
  GetPage(
    name: LoginScreen.routeName,
    page: () => const LoginScreen(),
  ),
  
  GetPage(
    name: SignUpScreen.routeName,
    page: () => SignUpScreen(),
  ),
  GetPage(
    name: HomeScreen.routeName,
    binding: BindingsBuilder(() {
      Get.put(HomeController());
    }),
    page: () => const HomeScreen(),
  ),
];
