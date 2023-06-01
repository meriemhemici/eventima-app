import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'accueil.dart';
import 'inscrit1.dart';
import 'mdpOublie.dart';
class Connecter extends StatefulWidget {
  @override
  _ConnecterState createState() => _ConnecterState();
}

class _ConnecterState extends State<Connecter> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isEmailValid = true;
  bool _isPasswordValid = true;

  void _login() {
    setState(() {
      _isEmailValid = _emailController.text.isNotEmpty;
      _isPasswordValid = _passwordController.text.isNotEmpty;

      if (_isEmailValid && _isPasswordValid) {
        // Logique de connexion ici
        showDialog(
          context: context,
          builder: (context) => Accueil(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Connecter',
                        style: TextStyle(
                          color: Color(0xff81d4fa),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50),
                      buildEmail(),
                      SizedBox(height: 20),
                      buildMotdepasse(),
                      SizedBox(height: 10),
                      buildMdpoubli(context),
                      SizedBox(height: 20),
                      buildConnectBtn(context),
                      SizedBox(height: 10),
                      buildInscrit(context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Text(
      'Email',
      style: TextStyle(
        color: Color(0xff81d4fa),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(height: 10),
    Container(
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
    BoxShadow(
    color: Colors.black26,
    blurRadius: 6,
    offset: Offset(0, 2),
    )
    ],
    ),
    height: 60,
    child: TextField(
    controller: _emailController,
    keyboardType: TextInputType.emailAddress,
    style: TextStyle(
    color: Colors.black87,
    ),
    decoration: InputDecoration(
    border: InputBorder.none,
    contentPadding: EdgeInsets.only(top: 14),
    prefixIcon: Icon(
    Icons.email,
    color: Color(0xff81d4fa),
    ),
    hintText:
    'Email',
      hintStyle: TextStyle(
        color: Colors.black38,
      ),
      errorText: _isEmailValid ? null : 'Veuillez entrer votre email',
    ),
    ),
    )
      ],
    );
  }

  Widget buildMotdepasse() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mot de passe',
          style: TextStyle(
            color: Color(0xff81d4fa),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ],
          ),
          height: 60,
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xff81d4fa),
              ),
              hintText: 'Mot de passe',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
              errorText:
              _isPasswordValid ? null : 'Veuillez entrer votre mot de passe',
            ),
          ),
        )
      ],
    );
  }

  Widget buildMdpoubli(context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => MdpOublie(),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 150),
        child: Text(
          'Mot de passe oublié ?',
          style: TextStyle(
            color: Color(0xff81d4fa),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget buildConnectBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _login,
        style: ElevatedButton.styleFrom(
          elevation: 5,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          primary: Color(0xff81d4fa),
        ),
        child: Text(
          'Se connecter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildInscrit(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Inscrit1(),
        );
      },
      child: Container(
        child: Text.rich(
          TextSpan(
            text: "Vous n'avez pas de compte ? ",
            style: TextStyle(
              color: Color(0xff81d4fa),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Inscrivez-vous',
                style: TextStyle(
                  color: Colors.pinkAccent,
                  decoration: TextDecoration.underline,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
