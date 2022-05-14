import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inv_admin/controller/firebaseController.dart';

final firebasecontroller = Get.put(firebaseController());

var quantity = 1.obs;

class Cardx extends StatelessWidget {
  Cardx({Key? key, @required this.cat}) : super(key: key);

  var b;
  final cat;

  @override
  Widget build(BuildContext context) {
    if (cat == "Food") {
      b = firebasecontroller.Foodb;
      firebasecontroller.mainl.value = firebasecontroller.Foodmainl.value;
    }
    if (cat == "Books") {
      b = firebasecontroller.Booksb;
      firebasecontroller.mainl.value = firebasecontroller.Booksmainl.value;
    }
    if (cat == "Stationery") {
      b = firebasecontroller.Stationaryb;
      firebasecontroller.mainl.value = firebasecontroller.Stationarymainl.value;
    }
    if (cat == "Others") {
      b = firebasecontroller.Othersb;
      firebasecontroller.mainl.value = firebasecontroller.Othersmainl.value;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: SizedBox(
          height: Get.height - 20,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: firebasecontroller.mainl.value.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        var a = firebasecontroller.mainl.value[index][5]
                            .toString()
                            .obs;
                        quantity.value = 1;
                        Get.bottomSheet(
                            SizedBox(
                              height: 700,
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                      height: 5,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 25.0),
                                  child: ClayContainer(
                                    height: 50,
                                    width: 320,
                                    borderRadius: 10.0,
                                    child: Center(
                                        child: Text(
                                            firebasecontroller
                                                .mainl.value[index][3],
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: ClayContainer(
                                    width: 320,
                                    height: 70,
                                    borderRadius: 10.0,
                                    child: Center(
                                        child: SizedBox(
                                      width: 160,
                                      height: 50,
                                      child: Center(
                                        child: Text(
                                            firebasecontroller
                                                .mainl.value[index][2],
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300)),
                                      ),
                                    )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: ClayContainer(
                                    width: 320,
                                    height: 60,
                                    borderRadius: 10.0,
                                    child: Center(
                                        child: Text(
                                            firebasecontroller
                                                    .mainl.value[index][5]
                                                    .toString() +
                                                "  Units In Stock!",
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: SizedBox(
                                    width: 320,
                                    height: 65,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: ClayContainer(
                                            curveType: CurveType.concave,
                                            height: 65,
                                            child: Center(
                                                child: Text(
                                                    firebasecontroller
                                                        .mainl[index][3],
                                                    style: GoogleFonts.ubuntu(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600))),
                                            customBorderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    bottomLeft:
                                                        Radius.circular(20)),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (quantity.value <
                                                int.parse(firebasecontroller
                                                    .mainl.value[index][5])) {
                                              quantity.value++;
                                            } else {}
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(width: 0),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(20),
                                                        bottomRight:
                                                            Radius.circular(
                                                                20))),
                                            child: ClayContainer(
                                              curveType: CurveType.convex,
                                              spread: 0,
                                              width: 100,
                                              height: 65,
                                              child: Center(
                                                  child: Obx(() => Text('X ' +
                                                      quantity.toString()))),
                                              customBorderRadius:
                                                  const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(20)),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 17.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      var quan = int.parse(firebasecontroller
                                              .mainl.value[index][5]) -
                                          quantity.value;
                                      firebasecontroller.mainl.value[index][5] =
                                          quan;
                                      firebasecontroller.setQuantity(
                                          firebasecontroller.mainl.value[index]
                                              [3],
                                          quan);
                                      quantity.value = 1;
                                      print(quan);
                                      Get.back();
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30.0))),
                                      child: Center(
                                        child: Text(
                                          "SOLD",
                                          style: GoogleFonts.ubuntu(
                                            textStyle: const TextStyle(
                                                color: Colors.white,
                                                letterSpacing: 1.8),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ));
                      },
                      child: ClayContainer(
                        width: Get.width - 60,
                        height: 130,
                        depth: 0,
                        spread: 10,
                        customBorderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ClayContainer(
                                      curveType: CurveType.none,
                                      height: 55,
                                      child: Center(
                                        child: Text(
                                            firebasecontroller
                                                .mainl.value[index][3],
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      customBorderRadius:
                                          const BorderRadius.only(
                                              topLeft: Radius.circular(20)),
                                    ),
                                    Expanded(
                                      child: ClayContainer(
                                        curveType: CurveType.none,
                                        child: Center(
                                            child: SizedBox(
                                          width: 160,
                                          height: 50,
                                          child: Center(
                                            child: Text(
                                                firebasecontroller
                                                    .mainl.value[index][2],
                                                style: GoogleFonts.ubuntu(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w300)),
                                          ),
                                        )),
                                        customBorderRadius:
                                            const BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                height: 130,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20))),
                              ),
                            ),
                            ClayContainer(
                              width: Get.width - 250,
                              height: 130,
                              surfaceColor: Colors.grey[100],
                              child: Center(
                                  child: Text(
                                      "₹ " +
                                          firebasecontroller
                                              .mainl.value[index][6]
                                              .toString(),
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600))),
                              customBorderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
