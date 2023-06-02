import 'dart:developer';
import 'package:appeventima/cat.dart';
import 'package:appeventima/categorie.dart';
import 'package:appeventima/panier.dart';
import 'package:appeventima/service.dart';
import 'package:appeventima/userInfoPage.dart';
import 'package:flutter/material.dart';

import 'accountPage.dart';
import 'detailPage.dart';
import 'fav.dart';
import 'favoriteWeight.dart';


class Accueil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccueilState();
  }
}


class AccueilState extends State<Accueil> {
  final List<Service> services = [
    Service(0, "Sheraton Hotel", "images/shert.jfif", "images/shert1.jfif", "images/shert2.jfif", "images/shert3.jfif", 23000, "Annaba",
      "Le Sheraton Annaba Hotel propose des hébergements à Annaba, à 5 minutes de route de la basilique Saint-Augustin, à 3 minutes du musée d'Hippone et à 400 mètres du port d'Annaba. Les chambres sont équipées d'une télévision à écran plat, ainsi que d'une salle de bains privative munie d'une baignoire et d'un bidet. L'aéroport d'Annaba - Rabah-Bitat est accessible en 20 minutes en voiture du Sheraton Annaba Hotel.",
      "10% de promotion", true, 820,
    ),
    Service(1, "Salle des fetes", "images/S2.jpg", "images/S4.jpg", "images/S2.jpg", "images/S4.jpg",  130000 , "Alger-Dely Brahim ",
      "vous accueille dans un cadre féerique digne des mille et une nuit pour y célébrer votre mariage.Vous avez le choix entre deux décos, une rouge et l\’autre verte\, comme vous pouvez disposer d\’un salon secondaire pour hommes.Une terrasse est également mise à votre disposition ainsi qu’un espace de restauration. La salle des fêtes vous propose aussi un service traiteur et vous offre même les boissons.",
      "20% de promotion", false, 700,
    ),
    Service(3, "Sucré Salée", "images/Buffets1.jpg", "images/sucre.jfif", "images/Buffets1.jpg", "images/sucre.jfif", 3000, "Skikda",
      "Nos salles sucrées sont renommées pour leurs délices irrésistibles, préparés avec expertise et offrant une explosion de saveurs inégalée. Laissez-vous séduire par nos créations uniques et succombez au plaisir sucré de nos délices faits maison.",
        "10% de promotion", true, 400,
    ),
    Service(4, "Sheraton Oran", "images/shert.jfif", "images/shert1.jfif", "images/shert2.jfif", "images/shert3.jfif", 23000, "Oran",
      "Le Sheraton Oran Hotel propose des hébergements à Annaba, à 5 minutes de route de la basilique Saint-Augustin, à 3 minutes du musée d'Hippone et à 400 mètres du port d'Annaba. Les chambres sont équipées d'une télévision à écran plat, ainsi que d'une salle de bains privative munie d'une baignoire et d'un bidet. L'aéroport d'Oran - Rabah-Bitat est accessible en 20 minutes en voiture du Sheraton Oran Hotel.",
      "25% de promotion", false, 8200,
    ),
    Service(5, "Hadil photo", "images/phg.jfif", "images/ph.jfif", "images/phg.jfif", "images/ph.jfif", 53000, "Annaba-Annaba",
      "Notre photographe capturera des moments inoubliables dans nos salles, créant des images saisissantes et mémorables. Faites confiance à notre talentueux professionnel pour immortaliser vos événements avec une expertise artistique et une attention aux détails exceptionnelles.",
      "30% de promotion", true, 200,
    ),


  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff81d4fa),
        title: Text("Eventima",),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Catégorie",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => Categorie(),);
                  },
                  child: Text(
                    "Voir plus >",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Column(
                  children: [
                    Icon(Icons.place),
                    Text("Endroit"),
                  ],
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Cat(),
                  );
                },
              ),
              IconButton(
                icon: Column(
                  children: [
                    Icon(Icons.music_note),
                    Text("Animation"),
                  ],
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Cat(),
                  );
                },
              ),
              IconButton(
                icon: Column(
                  children: [
                    Icon(Icons.design_services),
                    Text("Décoration"),
                  ],
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Cat(),
                  );
                },
              ),
              IconButton(
                icon: Column(
                  children: [
                    Icon(Icons.restaurant_menu),
                    Text("Buffet"),
                  ],
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Cat(),
                  );
                },
              ),

            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return ServiceItemWidget(services: service);
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
  const ServiceItemWidget({
    Key? key,
    required this.services,
  }) : super(key: key);
  final Service services;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=> ServiceDetailsItemWidget(services: services )));
      },
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 8,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Image.asset(
                services.image,
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
                            services.titre,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          FavoriteWidget(
                            isFavorited: services.isFavorited,
                            favoriteCount: services.favoriteCount,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "${services.prix}DZD", // Ajouter les guillemets pour utiliser la variable "prix" en tant que chaîne de caractères
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
      ),
    );
  }
}

