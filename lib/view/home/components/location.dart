import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/repositry/home_repositry.dart';
import 'package:weather/view_model/controllers/home_controller.dart';
import '../../../utils/utils.dart';
import 'map.dart';

class Location extends StatelessWidget {
  Location({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.getAddress(),
                style: const TextStyle(
                    height: 0, color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                Utils.formateDate(DateTime.now()),
                style: TextStyle(color: Colors.grey.withOpacity(.7), fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 150,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: MapCard(
                  latitude: HomeReposirty.lat, // 20.7556567,
                  longitude: HomeReposirty.lng, //70.7800333,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
