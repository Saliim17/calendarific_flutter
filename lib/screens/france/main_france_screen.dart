import 'package:calendarific/screens/france/france_body_screen.dart';
import 'package:calendarific/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

class MainFranceScreen extends StatefulWidget {
  const MainFranceScreen({Key? key}) : super(key: key);

  @override
  State<MainFranceScreen> createState() => _MainFranceScreenState();
}

class _MainFranceScreenState extends State<MainFranceScreen> {
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
            Container(
                margin: EdgeInsets.all(Dimensions.height10),
                child: BigText(text: "Holidays in France!", fontWeight: FontWeight.w700)
            ),
            Container(
              child: BigText(text: "Don't forget to select the year!", fontWeight: FontWeight.w100)
            ),
            //showing the body
            const Expanded(
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(), child: FranceBodyScreen())
            ),
          ],
        ),
      );
  }
}
