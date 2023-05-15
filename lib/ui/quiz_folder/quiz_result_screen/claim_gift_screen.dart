import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class ClaimGiftScreen extends StatelessWidget {
  const ClaimGiftScreen({Key? key}) : super(key: key);

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
                  'assets/images/claim_gift.svg',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 2),
                child: Text(
                  'A gift for a worthy ',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                'of your skills',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'You’ve received',
                        style: TextStyle(
                            fontSize: 16,
                            color: HexColor('#2E2E2E').withOpacity(0.5),
                            fontWeight: FontWeight.normal)),
                    TextSpan(
                        text: '25xp',
                        style: TextStyle(
                            fontSize: 16,
                            color: HexColor('#26B0FF'),
                            fontWeight: FontWeight.normal)),
                    TextSpan(
                        text: 'for all',
                        style: TextStyle(
                            fontSize: 16,
                            color: HexColor('#2E2E2E').withOpacity(0.5),
                            fontWeight: FontWeight.normal)),
                  ])),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  //   child: Text('You’ve received 25xp for all',
                  //       style: TextStyle(
                  //           fontSize: 16,
                  //           color: HexColor('#2E2E2E').withOpacity(0.5),
                  //           fontWeight: FontWeight.normal)),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('your hard work. Don’t spend it',
                        style: TextStyle(
                            fontSize: 16,
                            color: HexColor('#2E2E2E').withOpacity(0.5),
                            fontWeight: FontWeight.normal)),
                  ),
                  Text('all at once.',
                      style: TextStyle(
                          fontSize: 16,
                          color: HexColor('#2E2E2E').withOpacity(0.5),
                          fontWeight: FontWeight.normal))
                ],
              ),
              InkWell(
                onTap: () {},
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
                      'Claim Gift',
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
