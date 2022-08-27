import 'package:flutter/material.dart';
import 'package:shared_pref/presentation/features/widgets/home_screen.dart';
import 'package:shared_pref/presentation/features/widgets/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override

  void initState() {
    checkUserData();
  }
  checkUserData() async {
    bool userIn = await hasUserVisited();
    userVisitedData();
    if (userIn == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }



  userVisitedData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("LoginUser", true);
  }

  hasUserVisited() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool userActivityCheck = preferences.getBool("LoginUser") ?? false;
    return userActivityCheck;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
