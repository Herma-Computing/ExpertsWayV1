import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learncoding/ui/screens/IntroPage/screeen4.dart';


class SecondScreen extends StatelessWidget {
  
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 35, left: 35, top: 35),
                child: SvgPicture.asset(
                  'assets/images/thirs.svg',
                ),
              ),
              CircleAvatar(
                backgroundColor: HexColor('#26B0FF').withOpacity(1),
                radius: 45,
                child: Text(
                  '81',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'AMAZING',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  Text('You’re one step closer to etting to',
                      style: TextStyle(
                          fontSize: 16,
                          color: HexColor('#2E2E2E').withOpacity(0.5),
                          fontWeight: FontWeight.normal)),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(' your goals  Keep this up and you’ll ',
                        style: TextStyle(
                            fontSize: 16,
                            color: HexColor('#2E2E2E').withOpacity(0.5),
                            fontWeight: FontWeight.normal)),
                  ),
                  Text('be there  We Believe In You!  ',
                      style: TextStyle(
                          fontSize: 16,
                          color: HexColor('#2E2E2E').withOpacity(0.5),
                          fontWeight: FontWeight.normal))
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const Screenfour();
                  }));
                },
                child: Container(
                  margin: const EdgeInsets.all(42),
                  width: 208.47,
                  height: 44,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          HexColor('#26B0FF').withOpacity(1),
                          HexColor('#26B0FF'),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15)),
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
              ),
            ],
          ),
        )));
  }
}
