import 'package:appeventima/panier.dart';
import 'package:flutter/material.dart';

import 'accueil.dart';
import 'cat.dart';
import 'fav.dart';

class Categorie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff81d4fa),
        title: Text('Catégories'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        children: [
          _buildCategoryItem(Icons.place, 'Endroits', context),
          _buildCategoryItem(Icons.music_note, 'Animation', context),
          _buildCategoryItem(Icons.design_services, 'Décoration', context),
          _buildCategoryItem(Icons.restaurant_menu, 'Buffet', context),
          _buildCategoryItem(Icons.toys_sharp, 'Vêtements', context),
          _buildCategoryItem(Icons.woman, 'Beauté', context),
          _buildCategoryItem(Icons.camera, 'Photographe', context),
          _buildCategoryItem(Icons.design_services, 'Traiteur', context),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff81d4fa),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home , color: Colors.teal),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Compte',
          ),
        ],
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          if (index == 0) {
            showDialog(
              context: context,
              builder: (context) => Accueil(),
            );
          } else if (index == 1) {
            showDialog(
              context: context,
              builder: (context) => Fav(),
            );
          } else if (index == 2) {
            showDialog(
              context: context,
              builder: (context) => Panier(),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildCategoryItem(IconData icon, String title, BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Cat(),
        );
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
