import 'package:appeventima/panier.dart';
import 'package:appeventima/resarvationPage.dart';
import 'package:flutter/material.dart';
import 'package:appeventima/service.dart';

import 'accountPage.dart';
import 'accueil.dart';
import 'fav.dart';
import 'favoriteWeight.dart';

class DetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailPageState();
  }
}

class DetailPageState extends State<DetailPage> {

  final List<Service> services = [
    Service(0, "Sheraton Annaba Hotel", "images/sher.jpg ","images/sher1.jpg ","images/sher2.jpeg ","images/sher3.jpg ", 3000, "Annaba", "Le Sheraton Annaba Hotel propose des hébergements à Annaba, à 5 minutes de route de la basilique Saint-Augustin, à 3 minutes du musée d'Hippone et à 400 mètres du port d'Annaba. Les chambres sont équipées d'une télévision à écran plat, ainsi que d'une salle de bains privative munie d'une baignoire et d'un bidet. L'aéroport d'Annaba - Rabah-Bitat est accessible en 20 minutes en voiture du Sheraton Annaba Hotel.","10% de promotion", false, 820000),

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Les articles"),

      ),
      body: ListView.builder(itemCount: services.length,
        itemBuilder: (context, index){
          final service = services[index];
          return Dismissible(key: Key(service.titre),
              onDismissed: (direction){
                setState(() {
                  services.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${service.titre} supprimé")));
              },
              background: Container(color: Colors.red),
              child: ServiceDetailsItemWidget(services:service ));

        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff81d4fa),
        selectedItemColor: Colors.blue,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => ReservationPage(),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

class ServiceDetailsItemWidget extends StatelessWidget {
  const ServiceDetailsItemWidget({
    Key? key,
    required this.services,
  }) : super(key: key);
  final Service services;

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff81d4fa),
        title: Text(services.titre),

      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              services.image,
              height: 150,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                Image.asset(
                  services.img1,
                  height: 100,
                  width: 137,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  services.img2,
                  height: 100,
                  width: 137,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  services.img3,
                  height: 100,
                  width: 137,
                  fit: BoxFit.cover,
                ),
              ],
            ),





            SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    services.titre,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${services.prix.toString()} DZD',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>[
                  Text(
                    'Description ',
                    style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),
                  ),
                  FavoriteWidget( isFavorited: services.isFavorited,favoriteCount: services.favoriteCount,),
                ] ,
              ),

            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                services.descreption,
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Offres',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child:
              Text(
                services.offre,
                style: TextStyle(fontSize: 18),
              ),
            ),

            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child:
              Text(
                'Adress:',
                style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
              ),

            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                services.adress,
                style: TextStyle(fontSize: 18),
              ),
            ),

            SizedBox(height: 30),

          ],
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
                showDialog(
                  context: context,
                  builder: (context) => AccountPage(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => ReservationPage(),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );

  }
}
