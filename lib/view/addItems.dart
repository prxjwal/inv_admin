import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inv_admin/controller/addItemsController.dart';
import 'package:inv_admin/controller/mainController.dart';
import 'package:inv_admin/view/mainView.dart';
import '../controller/firebaseController.dart';
import '../model/MenuButtonWidget.dart';

final mainViewController = Get.put(MainController());
final firebasecontroller = Get.put(firebaseController());
final addController = Get.put(AddController());
const btn1 = "Books";
const btn2 = "Food";
const btn3 = "Stationary";
const btn4 = "Others";

class AddItems extends StatelessWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 55.0, right: 18),
        child: SizedBox(
          width: 110,
          height: 45,
          child: FloatingActionButton(
            onPressed: () {
              if (addController.productName == '') {
                Get.snackbar('⚠️', 'please fill the Product name');
              } else if (addController.price == '') {
                Get.snackbar('⚠️', 'please fill the price');
              } else if (addController.mrp == '') {
                Get.snackbar('⚠️', 'please fill the letter MRP');
              } else if (addController.quantity == '') {
                Get.snackbar('⚠️', 'please fill the price');
              } else {
                Get.snackbar('✔️', 'posted sucessfully!');
                firebasecontroller.addData();
              }
            },
            child: ClayContainer(
              width: 150,
              height: 60,
              borderRadius: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add',
                    style: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.add_circle_outline)
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: ClayContainer(
              depth: 30,
              height: 50,
              borderRadius: 200,
              width: Get.width - 40,
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    child: const Icon(Icons.arrow_back_ios),
                    onTap: () {
                      Get.to(const MainView());
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "ADD PRODUCT",
                    style: GoogleFonts.ubuntu(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        mainViewController.cat.value = 0;
                        print(btn1);
                        addController.cat = btn1;
                        addController.visib.value = 0;
                      },
                      child: const Menubutton(
                        topleft: 15,
                        bottomleft: 15,
                        topright: 0,
                        bottomright: 0,
                        validator: 0,
                        icondata: Icons.library_books,
                        title: btn1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        mainViewController.cat.value = 1;
                        print(btn2);
                        addController.cat = btn2;
                        addController.visib.value = 1;
                      },
                      child: const Menubutton(
                        topleft: 0,
                        bottomleft: 0,
                        topright: 0,
                        bottomright: 0,
                        validator: 1,
                        icondata: Icons.poll_outlined,
                        title: btn2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        mainViewController.cat.value = 2;
                        addController.cat = btn3;
                        addController.visib.value = 2;
                      },
                      child: const Menubutton(
                        topleft: 0,
                        bottomleft: 0,
                        topright: 0,
                        bottomright: 0,
                        validator: 2,
                        icondata: Icons.food_bank_outlined,
                        title: btn3,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        mainViewController.cat.value = 3;
                        addController.cat = btn4;
                        addController.visib.value = 3;
                      },
                      child: const Menubutton(
                        topleft: 0,
                        bottomleft: 0,
                        topright: 15,
                        bottomright: 15,
                        validator: 3,
                        icondata: Icons.outbond_outlined,
                        title: btn4,
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 22.0, bottom: 22.0),
                  child: Entrybox(
                    valkey: 0,
                    bottle: "productName",
                    heading: "Product name",
                    headingh: 40.0,
                    headingw: 300.0,
                    textboxh: 65.0,
                    textboxw: 500.0,
                    mainh: 140.0,
                    mainw: 300.0,
                    maxlen: 30,
                    maxline: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Entrybox(
                          valkey: 1,
                          bottle: "price",
                          mainh: 110.0,
                          mainw: 150.0,
                          textboxh: 45.0,
                          textboxw: 300.0,
                          maxlen: 7,
                          maxline: 1,
                          headingh: 40.0,
                          headingw: 300.0,
                          heading: 'Price'),
                      Entrybox(
                          valkey: 1,
                          bottle: "mrp",
                          mainh: 110.0,
                          mainw: 150.0,
                          textboxh: 45.0,
                          textboxw: 300.0,
                          maxlen: 7,
                          maxline: 1,
                          headingh: 40.0,
                          headingw: 300.0,
                          heading: 'MRP'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: addController.visib.value == 1
                        ? MainAxisAlignment.spaceEvenly
                        : MainAxisAlignment.center,
                    children: [
                      const Entrybox(
                          valkey: 1,
                          bottle: "quantity",
                          mainh: 110.0,
                          mainw: 150.0,
                          textboxh: 45.0,
                          textboxw: 300.0,
                          maxlen: 11,
                          maxline: 1,
                          headingh: 40.0,
                          headingw: 300.0,
                          heading: 'Quantity'),
                      Obx(() => Visibility(
                          visible:
                              addController.visib.value == 1 ? true : false,
                          child: const ExpiryW()))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 18.0, bottom: 25.0),
                  child: Entrybox(
                      valkey: 0,
                      bottle: "description",
                      mainh: 270.0,
                      mainw: 300.0,
                      textboxh: 200.0,
                      textboxw: 300.0,
                      maxlen: 500,
                      maxline: 25,
                      headingh: 40.0,
                      headingw: 300.0,
                      heading: 'Description'),
                )
              ],
            ),
          )),
        ],
      )),
    );
  }
}

class ExpiryW extends StatelessWidget {
  const ExpiryW({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        addController.expday = (await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2040)));

        if (addController.expday == null) {
          return;
        } else {
          addController.day.value = addController.expday!;

          var a = addController.day.value.toString().split(" ");
          addController.date = a[0];
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Container(
              width: 300.0,
              height: 40.0,
              decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.12),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  )),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    'Expiry Date',
                    style: GoogleFonts.ubuntu(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                width: 300.0,
                height: 45.0,
                child: Center(
                  child: Obx(
                    () => Text(
                      addController.day.value.day.toString() +
                          '/' +
                          addController.day.value.month.toString() +
                          "/" +
                          addController.day.value.year.toString(),
                      style: GoogleFonts.ubuntu(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.withOpacity(0.12),
        ),
        width: 150.0,
        height: 110.0,
      ),
    );
  }
}

class Entrybox extends StatelessWidget {
  const Entrybox({
    @required this.mainh,
    @required this.mainw,
    @required this.textboxh,
    @required this.textboxw,
    @required this.maxlen,
    @required this.maxline,
    @required this.headingh,
    @required this.headingw,
    @required this.heading,
    this.bottle,
    this.valkey,
    Key? key,
  }) : super(key: key);

  final bottle;
  final heading;
  final headingh;
  final headingw;
  final mainh;
  final mainw;
  final maxlen;
  final maxline;
  final textboxh;
  final textboxw;
  final valkey;

  @override
  Widget build(BuildContext context) {
    var a;
    if (valkey == 1) {
      a = TextInputType.number;
    }
    if (valkey == 0) {
      a = TextInputType.text;
    }
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Container(
            width: headingw,
            height: headingh,
            decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.12),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )),
            child: Row(
              children: [
                const SizedBox(width: 20),
                Text(
                  heading,
                  style: GoogleFonts.ubuntu(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              width: textboxw,
              height: textboxh,
              child: TextField(
                keyboardType: a,
                onChanged: (val) {
                  if (bottle == "productName") {
                    addController.productName = val;
                  }
                  if (bottle == "price") {
                    addController.price = val;
                  }
                  if (bottle == "mrp") {
                    addController.mrp = val;
                  }
                  if (bottle == "quantity") {
                    addController.quantity = val;
                  }
                  if (bottle == "description") {
                    addController.description = val;
                  }
                },
                decoration: const InputDecoration(),
                style: GoogleFonts.sourceSansPro(
                  fontSize: 18,
                ),
                maxLines: maxline,
                maxLength: maxlen,
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.withOpacity(0.12),
      ),
      width: mainw,
      height: mainh,
    );
  }
}
