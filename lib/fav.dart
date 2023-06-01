import 'package:appeventima/panier.dart';
import 'package:flutter/material.dart';
import 'package:appeventima/service.dart';

import 'accueil.dart';


class Fav extends StatefulWidget {
  @override
  _FavState createState() => _FavState();
}

class _FavState extends State<Fav> {

  final List<Service> services = [
    Service(0, "Sheraton Hotel", "images/shert.jfif", "images/shert1.jfif", "images/shert2.jfif", "images/shert3.jfif", 23000, "Annaba",
      "Le Sheraton Annaba Hotel propose des hébergements à Annaba, à 5 minutes de route de la basilique Saint-Augustin, à 3 minutes du musée d'Hippone et à 400 mètres du port d'Annaba. Les chambres sont équipées d'une télévision à écran plat, ainsi que d'une salle de bains privative munie d'une baignoire et d'un bidet. L'aéroport d'Annaba - Rabah-Bitat est accessible en 20 minutes en voiture du Sheraton Annaba Hotel.",
      "10% de promotion", true, 82000,
    ),
    Service(3, "Sucré Salée", "images/Buffets1.jpg", "images/sucre.jfif", "images/Buffets1.jpg", "images/sucre.jfif", 3000, "Skikda",
      "Nos salles sucrées sont renommées pour leurs délices irrésistibles, préparés avec expertise et offrant une explosion de saveurs inégalée. Laissez-vous séduire par nos créations uniques et succombez au plaisir sucré de nos délices faits maison.",
      "10% de promotion", true, 400,
    ),
    Service(5, "Hadil photo", "images/phg.jfif", "images/ph.jfif", "images/phg.jfif", "images/ph.jfif", 53000, "Annaba-Annaba",
      "Notre photographe capturera des moments inoubliables dans nos salles, créant des images saisissantes et mémorables. Faites confiance à notre talentueux professionnel pour immortaliser vos événements avec une expertise artistique et une attention aux détails exceptionnelles.",
      "30% de promotion", true, 20000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int total = services.fold(0, (sum, service) => sum + service.prix);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff81d4fa),
        title: Text('Fvaorite'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: ListView.builder(
          itemCount: services.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Image.asset(services[index].image,width: 100,),
                title: Text(services[index].titre),
                subtitle: Text('${services[index].prix} \$'),
                trailing: IconButton(
                  icon: Container(
                    child: Icon(Icons.favorite
                      , color: Colors.red,),

                  ),
                  onPressed: () {
                    setState(() {
                      services.removeAt(index);
                    });
                  },
                ),
              ),
            );
          },
        ),
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

              },
            ),
            label: 'Compte',
          ),
        ],
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
