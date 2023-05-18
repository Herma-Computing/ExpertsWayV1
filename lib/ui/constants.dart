import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

const kSecondaryColor = Color(0xFF8B94BC);
const kGreenColor = Color.fromARGB(255, 21, 255, 0);

final kRedColor = HexColor('#26B0FF').withOpacity(1);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const double kDefaultPadding = 8.0;
