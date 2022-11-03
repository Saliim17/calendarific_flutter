import 'package:calendarific/controllers/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../../size_config.dart';
import 'france_screen.dart';

class FranceBodyScreen extends StatefulWidget {
  const FranceBodyScreen({Key? key}) : super(key: key);

  @override
  State<FranceBodyScreen> createState() => _FranceBodyScreenState();
}

class _FranceBodyScreenState extends State<FranceBodyScreen> {

  ApiController apiController = FranceScreen.getApiController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(
          () => apiController.isLoading.value
          ? const Center(child: CircularProgressIndicator(),)
          : ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: apiController.jsonModel?.response?.holidays.length ?? 0,
          itemBuilder: (context, index) {
            final date = DateTime.parse(apiController.jsonModel?.response?.holidays[index].date?.iso);
            String dateFormatted = DateFormat.yMMMMd('en_US').format(date);
            return ListTile(
              title: Text(
                  apiController.jsonModel?.response?.holidays[index].name ?? 'no name'
              ),
              subtitle: Text(
                  apiController.jsonModel?.response?.holidays[index].description ?? 'no description'
              ),
              leading: Text(
                dateFormatted
              ),
            );
          }
      ),
    );
  }
}




