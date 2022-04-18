import 'package:flutter/material.dart';
import 'package:taxi_application/cubit/sign_in/sign_in_screen.dart';

import '../form/image.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SignUpScreen(),
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  background,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                height: screenSize.height,
                width: screenSize.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xff51C569),
                      const Color(0xff109F2E).withOpacity(0.8),

                    ],
                  ),
                ),
              ),
              Center(
                child: Image.asset(logotaxi),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
