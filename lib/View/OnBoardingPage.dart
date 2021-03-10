import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboard_getx/Controller/OnBordingController.dart';

class OnBordingPage extends StatelessWidget {
  final controller = OnBordingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.selectedPageIndex,
              itemCount: controller.onBoardingPage.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(controller.onBoardingPage[index].imageAsset),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        controller.onBoardingPage[index].title,
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 60),
                          child: Text(
                            controller.onBoardingPage[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ))
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                  children: List.generate(
                      controller.onBoardingPage.length,
                      (index) => Obx(() {
                            return Container(
                              margin: EdgeInsets.all(4),
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                  color: (controller.selectedPageIndex.value ==
                                          index)
                                      ? Colors.blue
                                      : Colors.grey),
                            );
                          }))),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                onPressed: () {
                  controller.forwardAction();
                },
                child: Obx(() =>
                    (controller.isLastPage) ? Text("Start") : Text("Next")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
