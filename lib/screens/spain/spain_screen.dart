import 'package:calendarific/screens/spain/spain_body_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

class SpainScreen extends StatefulWidget {
  const SpainScreen({Key? key}) : super(key: key);

  @override
  State<SpainScreen> createState() => _SpainScreenState();
}

class _SpainScreenState extends State<SpainScreen> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));

    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            color: Colors.lightBlue,
            margin: EdgeInsets.only(
                top: Dimensions.height45, bottom: Dimensions.height15
            ),
            padding: EdgeInsets.only(
                top: Dimensions.width10,
                left: Dimensions.width20,
                right: Dimensions.width20
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(
                    fontWeight: FontWeight.w900,
                    text: "CALENDARIFIC.",
                  ),
                ]
            ),
          ),
          //showing the body
          const Expanded(
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(), child: SpainBodyScreen())
          ),
        ],
      ),
    );

  }
}
