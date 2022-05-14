import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inv_admin/controller/mainController.dart';
import 'package:inv_admin/model/CardWidget.dart';
import 'package:inv_admin/view/addItems.dart';
import '../controller/firebaseController.dart';
import '../model/MenuButtonWidget.dart';

final mainViewController = Get.put(MainController());
final firebasecontroller = Get.put(firebaseController());

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          child: const Icon(Icons.add_circle_outline),
          onPressed: () {
            Get.to(const AddItems());
          },
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: Get.height - 20,
          child: Stack(
            children: [
              Column(children: [
                Obx(
                  () => Visibility(
                    visible: mainViewController.tap.value == 0 ? true : false,
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 80.0),
                              child: FutureBuilder(
                                  future: mainViewController.datafuturef,
                                  builder: ((context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    }
                                    return Cardx(
                                      cat: 'Food',
                                    );
                                  })),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: mainViewController.tap.value == 1 ? true : false,
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 80.0),
                              child: FutureBuilder(
                                  future: mainViewController.datafutureb,
                                  builder: ((context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    }
                                    return Cardx(
                                      cat: 'Books',
                                    );
                                  })),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: mainViewController.tap.value == 2 ? true : false,
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 80.0),
                              child: FutureBuilder(
                                  future: mainViewController.datafutures,
                                  builder: ((context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    }
                                    return Cardx(
                                      cat: 'Stationery',
                                    );
                                  })),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: mainViewController.tap.value == 3 ? true : false,
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 80.0),
                              child: FutureBuilder(
                                  future: mainViewController.datafutureo,
                                  builder: ((context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    }
                                    return Cardx(
                                      cat: 'Others',
                                    );
                                  })),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              const Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: UppermenuB(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UppermenuB extends StatelessWidget {
  const UppermenuB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => mainViewController.tap.value = 0,
          child: const MenuButton(
            topleft: 15,
            bottomleft: 15,
            topright: 0,
            bottomright: 0,
            validator: 0,
            icondata: Icons.food_bank_outlined,
            title: "Food",
          ),
        ),
        GestureDetector(
          onTap: () => mainViewController.tap.value = 1,
          child: const MenuButton(
            topleft: 0,
            bottomleft: 0,
            topright: 0,
            bottomright: 0,
            validator: 1,
            icondata: Icons.poll_outlined,
            title: "Books",
          ),
        ),
        GestureDetector(
          onTap: () => mainViewController.tap.value = 2,
          child: const MenuButton(
            topleft: 0,
            bottomleft: 0,
            topright: 0,
            bottomright: 0,
            validator: 2,
            icondata: Icons.stacked_bar_chart_outlined,
            title: "Stationary",
          ),
        ),
        GestureDetector(
          onTap: () => mainViewController.tap.value = 3,
          child: const MenuButton(
            topleft: 0,
            bottomleft: 0,
            topright: 15,
            bottomright: 15,
            validator: 3,
            icondata: Icons.outbond_outlined,
            title: "Others",
          ),
        )
      ],
    );
  }
}
