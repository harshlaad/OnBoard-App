import 'package:flutter/material.dart';
import 'package:onboard_getx/Model/OnBordingInfo.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class OnBordingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onBoardingPage.length - 1;

  forwardAction() {
    if (isLastPage) {
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnBordingInfo> onBoardingPage = [
    OnBordingInfo("assets/order.png", "Order Your Food",
        "Now you can order food any time right from your mobile"),
    OnBordingInfo("assets/cook.png", "Cooking Safe Food",
        "We are maintain safety and we keep clean while making food"),
    OnBordingInfo("assets/deliver.png", "Quick Delivery",
        "Orders your favorite meals will be immediately delivers"),
  ];
}
