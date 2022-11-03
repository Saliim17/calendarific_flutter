import 'package:calendarific/controllers/france_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../size_config.dart';

class FranceBodyScreen extends StatefulWidget {
  const FranceBodyScreen({Key? key}) : super(key: key);

  @override
  State<FranceBodyScreen> createState() => _FranceBodyScreenState();
}

class _FranceBodyScreenState extends State<FranceBodyScreen> {


  FranceController franceController = Get.put(FranceController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return franceController.isLoaded
        ? _buildScreen(franceController)
        : const Center(child: CircularProgressIndicator());
  }
}

Widget _buildScreen(FranceController franceController){
  return  ListView.builder(
      itemCount: franceController.franceHolidayModel!.response!.holidays?.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                padding: const EdgeInsets.only(left: 20),
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage("https://th.bing.com/th/id/R.67bacc8f41e95e2be456078377e32ddf?rik=5%2brnp3VE1noeUw&pid=ImgRaw&r=0"),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          franceController.franceHolidayModel!.response!.holidays![index].name!,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                        Text(
                            franceController.franceHolidayModel!.response!.holidays![index].date!.datetime!.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18)),
                        Text(
                            franceController.franceHolidayModel!.response!.holidays![index].description!,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18)),
                      ],
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            )
          ],
        );
      });
}


