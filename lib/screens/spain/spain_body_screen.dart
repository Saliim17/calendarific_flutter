import 'package:calendarific/controllers/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../../size_config.dart';
import '../home_screen.dart';

class SpainBodyScreen extends StatefulWidget {
  const SpainBodyScreen({Key? key}) : super(key: key);

  @override
  State<SpainBodyScreen> createState() => _SpainBodyScreenState();
}

class _SpainBodyScreenState extends State<SpainBodyScreen> {

  ApiController apiController = HomeScreen.getApiController();

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




