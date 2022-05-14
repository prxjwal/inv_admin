import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inv_admin/controller/addItemsController.dart';

final addController = Get.put(AddController());
final StreamController streamController = StreamController.broadcast();

class firebaseController extends GetxController {
  var Booksb = [];
  var Booksmainl = [].obs;
  var Foodb = [];
  var Foodmainl = [].obs;
  var Othersb = [];
  var Othersmainl = [].obs;
  var Stationaryb = [];
  var Stationarymainl = [].obs;
  var ab;
  var abc;
  var mainl = [].obs;

  addData() async {
    Map<String, dynamic> data = {
      "ExpiryDate": addController.date,
      "Category": addController.cat,
      "Description": addController.description,
      "ProductName": addController.productName,
      "Price": addController.price,
      "Quantity": addController.quantity,
      "MRP": addController.mrp,
    };

    var a = await FirebaseFirestore.instance
        .collection('products')
        .doc(addController.productName) // add document name to check if exists
        .get();
    if (a.exists) {
      print('Exists'); // if exists warn user
      return a;
    }
    if (!a.exists) {
      print('Not exists'); // if not add

      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('products');
      collectionReference
          .doc(addController.productName)
          .set(data)
          .then((value) => {
                if (data['Category'] == "Books")
                  {
                    ab = data.values.toList(),
                    Booksmainl.value.add(ab),
                  },
                if (data['Category'] == "Foods")
                  {abc = data.values.toList(), Foodmainl.value.add(abc)}
              })
          .catchError((error) => print("Failed to add user: $error"));
    }
  }

  getdataFood() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .where("Category", isEqualTo: 'Food')
        .get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs[i];

      Foodb.add(documentSnapshot.data());
    }

    for (int i = 0; i < Foodb.length; i++) {
      Foodmainl.add(Foodb[i].values.toList());
    }

    print(Foodmainl.value);
  }

  getdataBooks() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .where("Category", isEqualTo: 'Books')
        .get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs[i];

      Booksb.add(documentSnapshot.data());
    }

    for (int i = 0; i < Booksb.length; i++) {
      Booksmainl.value.add(Booksb[i].values.toList());
    }

    print(Booksmainl.value);
  }

  getdataStationary() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .where("Category", isEqualTo: 'Stationary')
        .get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs[i];

      Stationaryb.add(documentSnapshot.data());
    }

    for (int i = 0; i < Stationaryb.length; i++) {
      Stationarymainl.value.add(Stationaryb[i].values.toList());
    }
    print(Stationarymainl.value);
  }

  getdataOthers() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .where("Category", isEqualTo: 'Others')
        .get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs[i];

      Othersb.add(documentSnapshot.data());
    }

    for (int i = 0; i < Othersb.length; i++) {
      Othersmainl.value.add(Othersb[i].values.toList());
    }
    print(Othersmainl.value);
  }

  setQuantity(String item, int quan) {
    CollectionReference setq =
        FirebaseFirestore.instance.collection('products');
    setq
        .doc(item)
        .update({'Quantity': quan})
        .whenComplete(() => print('Updated'))
        .catchError((e) => print(e));
  }
}
