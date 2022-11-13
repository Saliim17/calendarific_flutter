import 'package:calendarific/screens/spain/spain_body_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../controllers/api_controller.dart';
import '../../size_config.dart';
import '../../widgets/big_text.dart';

class SpainScreen extends StatefulWidget {

  static ApiController apiController = ApiController();
  static ApiController getApiController() => apiController;

  const SpainScreen({Key? key}) : super(key: key);

  @override
  State<SpainScreen> createState() => _SpainScreenState();
}

class _SpainScreenState extends State<SpainScreen> {

  ApiController apiController = SpainScreen.getApiController();
  // use this controller to get what the user typed
  final _textController = TextEditingController();

  // store user text input into variable
  String userInput = "";

  _loadResource (BuildContext context) {

    if (userInput == "")  {
      apiController.setYear("2022");
    } else {
      apiController.setYear(userInput);
    }
    apiController.setCountry("ES");
    apiController.fetchData();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) =>_loadResource(context));
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));

    SizeConfig().init(context);


    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            color: CupertinoColors.destructiveRed,
            margin: EdgeInsets.only(
                top: SizeConfig.height45, bottom: SizeConfig.height15
            ),
            padding: EdgeInsets.only(
                top: SizeConfig.width10,
                left: SizeConfig.width20,
                right: SizeConfig.width20
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
              margin: EdgeInsets.all(SizeConfig.height10),
              child: BigText(text: "Holidays in Spain!", fontWeight: FontWeight.w700)
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.height15),
            child: Container(
              width: SizeConfig.screenWidth! * 0.9,
              height: SizeConfig.screenHeight! / 14,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(240, 240, 240, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          userInput = _textController.text;
                          apiController.setYear(userInput);
                          apiController.fetchData();
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.width20),
                        child: Icon(
                          Icons.search,
                          size: SizeConfig.iconSize24,
                        ),
                      )),
                  Expanded(
                    child: TextField(
                        onTap: () {
                          setState(() {
                            userInput = _textController.text;
                            apiController.setYear(userInput);
                            apiController.fetchData();
                          });
                        },
                        textInputAction: TextInputAction.search,
                        controller: _textController,
                        decoration: InputDecoration(
                            hintText: "Select the year!",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: SizeConfig.font16,
                            ),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _textController.clear();
                                },
                                icon: const Icon(Icons.clear)
                            )
                        )),
                  ),
                ],
              ),
            ),
          ),
          //showing the body
          const Expanded(
              child: SpainBodyScreen()),
          SizedBox(height: SizeConfig.screenHeight! * 0.01)
        ],
      ),
    );
  }
}
