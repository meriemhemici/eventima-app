import 'package:appeventima/panier.dart';
import 'package:flutter/material.dart';

import 'accueil.dart';
import 'fav.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // Contrôleurs de texte pour chaque champ du formulaire
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    // Remplir les champs avec les informations existantes de l'utilisateur
    _nameController.text = "Meriem Hemici";
    _emailController.text = "hemicimeriiem@.com";
    _passwordController.text = "********";
    _phoneController.text = "0673755149";
    _addressController.text = "09rue isset idir,Annaba";
    _dateController.text = ' ';

    super.initState();
  }

  @override
  void dispose() {
    // Libérer les ressources des contrôleurs de texte
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    // Récupérer les nouvelles valeurs des champs et enregistrer les modifications
    String newName = _nameController.text;
    String newEmail = _emailController.text;
    String newPassword = _passwordController.text;
    String newPhone = _phoneController.text;
    String newAddress = _addressController.text;
    String newdate = _dateController.text;

    // Logique pour enregistrer les modifications dans la base de données ou autre
    // ...

    // Afficher une notification de réussite
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Modifications enregistrées avec succès')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff81d4fa),
        title: Text('Modifier le compte'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nom',
              ),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
              ),
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Téléphone',
              ),
            ),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Adresse',
              ),
            ),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date de naissance',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveChanges,
              child: Text('Enregistrer les modifications'),
            ),
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
                // Action pour le bouton Accueil
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
                // Action pour le bouton Favoris
                showDialog(
                  context: context,
                  builder: (context) => Fav(),
                );
              },
            ),
            label: 'Favoris',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Action pour le bouton Panier
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
                // Action pour le bouton Compte
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
