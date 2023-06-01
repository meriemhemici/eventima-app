import 'package:appeventima/panier.dart';
import 'package:flutter/material.dart';

import 'accountPage.dart';
import 'accueil.dart';
import 'fav.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff81d4fa),
        title: Text('Paiement'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Informations de paiement',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nom du titulaire de la carte',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Numéro de carte',
            ),
            keyboardType: TextInputType.number,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Date d\'expiration',
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Code CVV',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Logique pour effectuer le paiement
              showDialog(
                context: context,
                builder: (context) => PaymentSuccessDialog(),
              );
            },
            child: Text('Payer'),
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


    );
  }
}

class PaymentSuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Succès du paiement'),
      content: Text('Votre paiement a été effectué avec succès.'),
      actions: [
        TextButton(
          onPressed: () {
            // Retour à la page précédente après le succès du paiement
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
