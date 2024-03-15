import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/view_model/controllers/home_controller.dart';

import '../../../res/images/image_assets.dart';
import '../../../utils/utils.dart';

class InfoCard extends StatelessWidget {
  InfoCard({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.24,
      margin: const EdgeInsets.only(bottom: 30),
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
            Colors.blue.withOpacity(.7),
            Colors.blue,
          ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Obx(() => Image.asset(
                    controller.getImage(controller.currentIndex.value),
                    height: size.height * 0.14,
                    width: size.width * 0.28,
                    fit: BoxFit.fill,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      controller.getCondition(),
                      style: const TextStyle(
                          height: 0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    Utils.currentTime(),
                    style: TextStyle(
                        height: 0,
                        color: Colors.white.withOpacity(.8),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.white.withOpacity(.1)],
                  ).createShader(bounds);
                },
                child: Obx(() => Text(
                      controller.getCurrentTemp(),
                      style: const TextStyle(
                        fontSize: 60,
                        height: 0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
              ),
              Obx(
                () => Text(
                  'Feel like ${controller.getFeelLike()}',
                  style:
                      const TextStyle(height: 0, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Image.asset(
                ImageAssets.windWave,
                height: size.height * 0.1,
                width: size.width * 0.4,
              )
            ],
          )
        ],
      ),
    );
  }
}
