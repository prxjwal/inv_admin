import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/mainController.dart';

final mainViewController = Get.put(MainController());

class MenuButton extends StatelessWidget {
  const MenuButton(
      {Key? key,
      @required this.topright,
      @required this.topleft,
      @required this.bottomleft,
      @required this.bottomright,
      @required this.icondata,
      @required this.title,
      @required this.validator})
      : super(key: key);
  final topright;
  final topleft;
  final bottomright;
  final bottomleft;
  final validator;
  final icondata;
  final title;
  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          decoration: BoxDecoration(
            border: Border.all(width: 0),
            color: mainViewController.tap.value == validator
                ? Colors.grey[200]
                : Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(topright.toDouble()),
              bottomRight: Radius.circular(bottomright.toDouble()),
              topLeft: Radius.circular(topleft.toDouble()),
              bottomLeft: Radius.circular(bottomleft.toDouble()),
            ),
          ),
          width: mainViewController.tap.value == validator ? 135 : 45,
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icondata,
                size: 33,
              ),
              Visibility(
                  visible:
                      mainViewController.tap.value == validator ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ))
            ],
          ),
        ));
  }
}

class Menubutton extends StatelessWidget {
  const Menubutton(
      {Key? key,
      @required this.topright,
      @required this.topleft,
      @required this.bottomleft,
      @required this.bottomright,
      @required this.icondata,
      @required this.title,
      @required this.validator})
      : super(key: key);
  final topright;
  final topleft;
  final bottomright;
  final bottomleft;
  final validator;
  final icondata;
  final title;
  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          decoration: BoxDecoration(
            border: Border.all(width: 0),
            color: mainViewController.cat.value == validator
                ? Colors.grey.withOpacity(0.2)
                : null,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(topright.toDouble()),
              bottomRight: Radius.circular(bottomright.toDouble()),
              topLeft: Radius.circular(topleft.toDouble()),
              bottomLeft: Radius.circular(bottomleft.toDouble()),
            ),
          ),
          width: mainViewController.cat.value == validator ? 135 : 45,
          height: 55,
          duration: const Duration(milliseconds: 400),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icondata),
              Visibility(
                  visible:
                      mainViewController.cat.value == validator ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ))
            ],
          ),
        ));
  }
}
