import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';


class QuizRatingScreen extends StatelessWidget {
  const QuizRatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        body: SafeArea(
            child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(right: 35, left: 35, bottom: 400),
            child: SvgPicture.asset(
              'assets/images/personal_goal.svg',
            ),
          ),
          Center(
            child: Container(
              height: 270,
              color: Colors.white,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8, right: 18, top: 18),
                    child: Text('Like the course so far?'),
                  ),
                  const Text('Rate it out of 5 stars'),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  const Text('Your Feedback will help us structure'),
                  const Text('the course better.'),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (BuildContext context) {
                      //   return const Screenfour();
                      // }));
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
            ),
          ),
        ])));
  }
}
