import 'package:appeventima/panier.dart';
import 'package:flutter/material.dart';

import 'accountPage.dart';
import 'accueil.dart';
import 'fav.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  // Exemple de données utilisateur
  String userName = 'Meriem Hemici';
  String email = 'hemecimeriiem@gmail.com';
  String address = '09 rue isset idir';
  String phoneNumber = '0673755149';
  String date=' ';

  // Contrôleurs pour les champs modifiables
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  // État de l'édition des informations personnelles
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    // Initialiser les contrôleurs avec les données utilisateur existantes
    nameController.text = userName;
    emailController.text = email;
    addressController.text = address;
    phoneNumberController.text = phoneNumber;
    dateController.text=date;
  }

  @override
  void dispose() {
    // Libérer les ressources des contrôleurs
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void toggleEdit() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void saveChanges() {
    setState(() {
      // Enregistrer les modifications dans les variables de données utilisateur
      userName = nameController.text;
      email = emailController.text;
      address = addressController.text;
      phoneNumber = phoneNumberController.text;
      date= dateController.text;

      // Terminer le mode d'édition
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff81d4fa),
        title: Text('Informations personnelles'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Nom'),
            subtitle: isEditing
                ? TextFormField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Nom'),
            )
                : Text(userName),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: isEditing
                ? TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            )
                : Text(email),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Adresse'),
            subtitle: isEditing
                ? TextFormField(
              controller: addressController,
              decoration: InputDecoration(hintText: 'Adresse'),
            )
                : Text(address),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Numéro de téléphone'),
            subtitle: isEditing
                ? TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(hintText: 'Numéro de téléphone'),
            )
                : Text(phoneNumber),
          ),
          ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text('Date d\'anniverssaire'),
            subtitle: isEditing
                ? TextFormField(
              controller: dateController,
              decoration: InputDecoration(hintText: 'Date d\anniversaire'),
            )
                : Text(date),
          ),

          SizedBox(height: 20),
          if (!isEditing)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountPage()),
                );
              },
              child: Text('Modifier les informations'),
            ),
          if (isEditing)
            ElevatedButton(
              onPressed: saveChanges,
              child: Text('Enregistrer les modifications'),
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

    );
  }
}
