import 'package:flutter/material.dart';

import 'connecter.dart';

class MdpOublie3 extends StatefulWidget {
  @override
  _MdpOublie3State createState() => _MdpOublie3State();
}

class _MdpOublie3State extends State<MdpOublie3> {
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

              decoration: InputDecoration(
                icon: Icon(Icons.password),
                labelText: 'nouveau mot de passe',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Connecter'),
              onPressed: () {
                showDialog(context: context, builder: (context) => Connecter() ,);
              },
            ),
          ],
        ),
      ),


    );
  }
}
