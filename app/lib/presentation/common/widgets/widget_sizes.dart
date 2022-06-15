import 'package:flutter/cupertino.dart';

const sideMenuWidth = 240.0;
const titleBarHeight = 30.0;

double listViewPadding(BuildContext context) =>
    MediaQuery.of(context).size.width > 1050 ? 30.0 : 15.0;
