import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final genProductProvider = FutureProvider<void>((ref) async {
  final db = FirebaseFirestore.instance;

  const gender = ["Nam", "Nữ", "Trẻ em"];
  const material = ["Vải", "Da"];
  const category = ["Hot", "Best seller"];

  const photos = [
    "https://firebasestorage.googleapis.com/v0/b/appbangiay-24276.appspot.com/o/product%2Fnau.jpeg?alt=media&token=b1937bc9-f25a-462b-b648-cda6a445e4b3",
    "https://firebasestorage.googleapis.com/v0/b/appbangiay-24276.appspot.com/o/product%2Fvang.jpeg?alt=media&token=67567226-12d8-494d-b227-d0c8fea8667d",
    "https://firebasestorage.googleapis.com/v0/b/appbangiay-24276.appspot.com/o/product%2Fxanh_la.jpeg?alt=media&token=ccce4678-279d-466e-8fde-37418aad7e2c",
    "https://firebasestorage.googleapis.com/v0/b/appbangiay-24276.appspot.com/o/product%2Ftrang.jpeg?alt=media&token=01bcd515-9333-47d6-8aa9-574d8d09438f",
    "https://firebasestorage.googleapis.com/v0/b/appbangiay-24276.appspot.com/o/product%2Fden.jpeg?alt=media&token=c9754678-b10c-49f8-bf98-06d4b18ab4a8",
    "https://firebasestorage.googleapis.com/v0/b/appbangiay-24276.appspot.com/o/product%2Fxanh_duong.jpeg?alt=media&token=115e96c7-f7f7-4fc2-9f25-4d80568f3483",
  ];
  for (var i = 0; i < 3; i++) {
    String name = "Giày ${gender[i]}";
    for (var j = 0; j < 2; j++) {
      String nameM = "$name ${material[j]}";
      for (var z = 0; z < 2; z++) {
        String nameCa = "$nameM ${category[z]}";
        String id = "";
        int price = 200 + Random().nextInt(1000 - 200 + 1);
        int salePrice = price - (200 + Random().nextInt(400 - 200 + 1));
        final newProRef = db.collection("product");
        id = await newProRef.add({
          "name": nameCa,
          "idCategory": db.doc("category/category-${z + 1}"),
          "idMaterial": db.doc("material/material-${j + 1}"),
          "idGender": db.doc("gender/gender-${i + 1}"),
          "price": price * 1000,
          "salePrice": salePrice * 1000,
          "description":
              "Duis dolor mollit occaecat aliquip voluptate commodo ipsum occaecat elit culpa. Mollit aute pariatur minim laborum dolore nisi proident. Magna adipisicing anim do ipsum aliquip eiusmod tempor enim duis. Minim et excepteur tempor adipisicing aute sint velit non.",
        }).then((value) => value.id);
        for (var c = 0; c < 6; c++) {
          for (var s = 0; s < 4; s++) {
            final newVariantRef = db.collection("variant");
            await newVariantRef.add({
              "idSize": db.doc("size/size-${s + 1}"),
              "idColor": db.doc("color/color-${c + 1}"),
              "idProduct": db.doc("product/$id"),
              "photo": photos[c],
            });
          }
        }
      }
    }
  }

  return;
});
