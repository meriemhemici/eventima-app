import 'package:appeventima/accountPage.dart';
import 'package:appeventima/panier.dart';
import 'package:flutter/material.dart';

import 'accueil.dart';
import 'fav.dart';

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _dateController = TextEditingController();
  final _heureDebutController = TextEditingController();
  final _heureFinController = TextEditingController();
  final _nbPersonnesController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff81d4fa),
        title: Text('Réservation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child:
        ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _nomController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Nom',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Veuillez saisir votre nom';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    controller: _prenomController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Prénom'),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Veuillez saisir votre prénom';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _dateController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        icon: Icon(Icons.calendar_month),
                        labelText: 'Date'),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Veuillez saisir la date de réservation';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _heureDebutController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        icon: Icon(Icons.access_time),
                        labelText: 'Heure de début'),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Veuillez saisir l\'heure de début';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _heureFinController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        icon: Icon(Icons.access_time),
                        labelText: 'Heure de fin'),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Veuillez saisir l\'heure de fin';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _nbPersonnesController,

                    decoration: InputDecoration(
                        icon: Icon(Icons.person_3),
                        labelText: 'Nombre de personnes'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Veuillez saisir le nombre de personnes';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _messageController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        icon: Icon(Icons.message),
                        labelText: 'Message'),
                    maxLines:null,
                  ),
                  SizedBox(height: 16.0),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          // Enregistrer la réservation
                          String nom = _nomController.text;
                          String prenom = _prenomController.text;
                          String date = _dateController.text;
                          String heureDebut = _heureDebutController.text;
                          String heureFin = _heureFinController.text;
                          int nbPersonnes = int.parse(_nbPersonnesController.text);
                          String message = _messageController.text;

                          // Afficher un message de confirmation
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Réservation enregistrée'),
                                content: Text(
                                    'Merci $prenom $nom, votre réservation pour $date de $heureDebut à $heureFin pour $nbPersonnes personne(s) a bien été enregistrée. Nous avons pris en compte votre message: "$message".'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Fermer'),
                                  ),

                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text('Réserver'),

                    ),


                ],
              ),
            ),
          ],
        ) ,
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

