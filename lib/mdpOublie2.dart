import 'package:appeventima/mdpOublie3.dart';
import 'package:flutter/material.dart';

class MdpOublie2 extends StatefulWidget {
  @override
  _MdpOublie2State createState() => _MdpOublie2State();
}

class _MdpOublie2State extends State<MdpOublie2> {
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
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: Icon(Icons.numbers),
                labelText: 'Code',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Continue'),
              onPressed: () {
                showDialog(context: context, builder: (context) => MdpOublie3() ,);
              },
            ),
          ],
        ),
      ),

    );
  }
}
