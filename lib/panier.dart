import 'package:appeventima/paymentPage.dart';
import 'package:appeventima/userInfoPage.dart';
import 'package:flutter/material.dart';
import 'package:appeventima/service.dart';

import 'accountPage.dart';
import 'accueil.dart';
import 'fav.dart';
import 'resarvationPage.dart';

class Panier extends StatefulWidget {
  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  final List<Service> services = [
    Service(
      5,
      "Hadil photo",
      "images/phg.jfif",
      "images/ph.jfif",
      "images/phg.jfif",
      "images/phg.jfif",
      53000,
      "Annaba-Annaba",
      "Notre photographe capturera des moments inoubliables dans nos salles, créant des images saisissantes et mémorables. Faites confiance à notre talentueux professionnel pour immortaliser vos événements avec une expertise artistique et une attention aux détails exceptionnelles.",
      "30% de promotion",
      true,
      20000,
    ),
    Service(
      0,
      "Sheraton Hotel",
      "images/shert.jfif",
      "images/shert1.jfif",
      "images/shert2.jfif",
      "images/shert3.jfif",
      23000,
      "Annaba",
      "Le Sheraton Annaba Hotel propose des hébergements à Annaba, à 5 minutes de route de la basilique Saint-Augustin, à 3 minutes du musée d'Hippone et à 400 mètres du port d'Annaba. Les chambres sont équipées d'une télévision à écran plat, ainsi que d'une salle de bains privative munie d'une baignoire et d'un bidet. L'aéroport d'Annaba - Rabah-Bitat est accessible en 20 minutes en voiture du Sheraton Annaba Hotel.",
      "10% de promotion",
      true,
      82000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int total = services.fold(0, (sum, service) => sum + service.prix);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff81d4fa),
        title: Text('Mon panier'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: ListView.builder(
          itemCount: services.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Image.asset(services[index].image, width: 100),
                title: Text(services[index].titre),
                subtitle: Text('${services[index].prix} \DZD'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.teal),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => ReservationPage(),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          services.removeAt(index);
                        });
                      },
                    ),
                  ],
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
              icon: Icon(Icons.shopping_cart , color: Color(0x2F034BFF)),
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
      bottomSheet: BottomAppBar(
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('Total : $total \DZD'),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white), // Couleur du texte
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue), // Couleur de l'arrière-plan du bouton
                  ),
                  child: Text('Payer'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => PaymentPage(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
