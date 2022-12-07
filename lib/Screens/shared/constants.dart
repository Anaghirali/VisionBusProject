import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kPrimaryColor = Color.fromARGB(255, 0, 128, 0);
const kPrimaryLightColor = Color.fromARGB(255, 214, 252, 214);

const kSpacingUnit = 10;

const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color.fromARGB(255, 47, 160, 47);

final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);

final kButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor
);

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'LibreBaskerville',
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
    color: kLightSecondaryColor
  ),
  textTheme: ThemeData.light().textTheme.apply(
    fontFamily: 'LibreBaskerville',
    bodyColor: kLightPrimaryColor,
    displayColor: kLightPrimaryColor
  )
);

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'LibreBaskerville',
  primaryColor: kLightPrimaryColor,
  canvasColor: kLightPrimaryColor,
  backgroundColor: kLightSecondaryColor,
  iconTheme: ThemeData.light().iconTheme.copyWith(
    color: kDarkSecondaryColor
  ),
  textTheme: ThemeData.light().textTheme.apply(
    fontFamily: 'LibreBaskerville',
    bodyColor: kDarkPrimaryColor,
    displayColor: kDarkPrimaryColor
  )
);

