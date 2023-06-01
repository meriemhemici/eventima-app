import 'dart:developer';
import 'package:appeventima/categorie.dart';
import 'package:appeventima/panier.dart';
import 'package:appeventima/service.dart';
import 'package:appeventima/userInfoPage.dart';
import 'package:flutter/material.dart';
import 'accountPage.dart';
import 'accueil.dart';
import 'detailPage.dart';
import 'fav.dart';
import 'favoriteWeight.dart';

class Cat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CatState();
  }
}

class CatState extends State<Cat> {
  final List<Service> services = [
    Service(0, "Sheraton Hotel", "images/shert.jfif", "images/shert1.jfif", "images/shert2.jfif", "images/shert3.jfif", 23000, "Annaba",
      "Le Sheraton Annaba Hotel propose des hébergements à Annaba, à 5 minutes de route de la basilique Saint-Augustin, à 3 minutes du musée d'Hippone et à 400 mètres du port d'Annaba. Les chambres sont équipées d'une télévision à écran plat, ainsi que d'une salle de bains privative munie d'une baignoire et d'un bidet. L'aéroport d'Annaba - Rabah-Bitat est accessible en 20 minutes en voiture du Sheraton Annaba Hotel.",
      "10% de promotion", false, 820000,
    ),
    Service(2, "Sheraton Hotel", "images/shert.jfif", "images/shert1.jfif", "images/shert2.jfif", "images/shert3.jfif", 23000, "Oran",
      "Le Sheraton Oran Hotel propose des hébergements à Annaba, à 5 minutes de route de la basilique Saint-Augustin, à 3 minutes du musée d'Hippone et à 400 mètres du port d'Annaba. Les chambres sont équipées d'une télévision à écran plat, ainsi que d'une salle de bains privative munie d'une baignoire et d'un bidet. L'aéroport d'Oran - Rabah-Bitat est accessible en 20 minutes en voiture du Sheraton Oran Hotel.",
      "10% de promotion", false, 820000,
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff81d4fa),
        title: Text(
          "Eventima",
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.8),
                ),
                hintText: 'Rechercher un service',
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return ServiceItemWidget(service: service);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff81d4fa),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Accueil(),
                );
              },
            ),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Fav(),
                );
              },
            ),
            label: 'Favorie',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Panier(),
                );
              },
            ),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => UserInfoPage(),
                );
              },
            ),
            label: 'Compte',
          ),
        ],
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ServiceItemWidget extends StatelessWidget {
  final Service service;

  const ServiceItemWidget({required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 8,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Image.asset(
              service.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          service.titre,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        FavoriteWidget(
                          isFavorited: service.isFavorited,
                          favoriteCount: service.favoriteCount,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${service.prix}", // Ajouter les guillemets pour utiliser la variable "prix" en tant que chaîne de caractères
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
