import 'package:appeventima/cat.dart';
import 'package:appeventima/detailsPage.dart';
import 'package:appeventima/fav.dart';
import 'package:appeventima/homePage.dart';
import 'package:appeventima/inscrit2.dart';
import 'package:appeventima/inscrit3.dart';
import 'package:appeventima/panier.dart';
import 'package:appeventima/paymentPage.dart';
import 'package:appeventima/userInfoPage.dart';
import 'package:flutter/material.dart';

import 'accountPage.dart';
import 'accueil.dart';

import 'categorie.dart';
import 'connecter.dart';
import 'detailPage.dart';
import 'inscrit1.dart';
import 'inscrit2.dart';
import 'inscrit3.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Categorie(),
    );
  }
}