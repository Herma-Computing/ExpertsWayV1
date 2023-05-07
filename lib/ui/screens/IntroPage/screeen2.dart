import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/second.svg',
                    ),
                    Text('Good Job'),
                    const Text('Good Job, You’re making progress but we believe that +'
              ' you can do even more. Don’t Give Up!!'),
                    Container(
                      margin: const EdgeInsets.all(60),
                      width: 208.47,
                      height: 44,
                      decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xff15BE77),
                    Color(0xff53E88B),
                  ],
                ),
                borderRadius: BorderRadius.circular(10)),
                      child: const Center(
              child: Text(
                'Continue',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
                      ),
                    ),
                  ],
                ),
            )));
  }
}
