import 'package:flutter/material.dart';

import 'mdpOublie2.dart';

class MdpOublie extends StatefulWidget {
  @override
  _MdpOublieState createState() => _MdpOublieState();
}

class _MdpOublieState extends State<MdpOublie> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xff81d4fa),
        title: Text('Mot de passe oublié'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: 'Adresse e-mail',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Envoyer un e-mail de récupération de mot de passe'),
              onPressed: () {
                showDialog(context: context, builder: (context) => MdpOublie2() ,);
                // Envoyer l'email de récupération de mot de passe à l'adresse e-mail saisie
                String emailAddress = _emailController.text;
                // TODO: envoyer l'email de récupération de mot de passe à l'adresse e-mail saisie
              },
            ),
          ],
        ),
      ),

    );
  }
}


