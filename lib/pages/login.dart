import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starbucks/pages/home.dart';
import 'package:starbucks/utils/globals.dart' as global;

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }

}


class LoginState extends State<LoginPage>{
  var _showPass = true;
  var _wrongPass = false;
  var _wrongEmail = false;
  var _showPassErr = '';
  var _showEmailErr = '';
  var _email = TextEditingController();
  var _password = TextEditingController();

  void _validate(){
    if(_email.text == ""){
      setState(() {
        _wrongEmail = true;
        _showEmailErr = 'Email must not be empty!';
      });
    }else if (!_email.text.toString().contains('@') || !_email.text.toString().contains('.com') || _email.text.toString().contains('@.com')){
      setState(() {
        _wrongEmail = true;
        _showEmailErr = 'Email is invalid!';
      });
    }
    if(_password.text == ""){
      setState(() {
        _wrongPass = true;
        _showPassErr = 'Password must not be empty!';
      });
    }else if(_password.text.toString().length < 8){
      setState(() {
        _wrongPass = true;
        _showPassErr = 'Password must be at least 8 characters';
      });
      return;
    }
    var _specialChar = false;
    var _alphabet = false;
    var _number = false;
    var pass = _password.text;
    pass.runes.forEach((element) {
      if((element >= 65 && element <= 90) || (element >= 97 && element <= 122) ){
        _alphabet = true;
      }
      else if(element >= 48 && element <= 57){
        _number = true;
      }else _specialChar = true;
    });

    if(_specialChar){
      setState(() {
        _wrongPass = true;
        _showPassErr = 'Password must not contains symbols!';
      });
    }else if(!_alphabet || !_number){
      setState(() {
        _wrongPass = true;
        _showPassErr = 'Password must be alphanumeric!';
      });
    }else{
      global.username = _email.text.substring(0, _email.text.toString().indexOf('@'));
      Navigator.push(context, 
        MaterialPageRoute(builder: (context){
          return HomePage();
        })
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.asset('assets/logo.png'),
            ),
            Text(
              'STARBUCKS',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 60,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'Email',
                prefixIcon: Icon(Icons.mail),
                errorText: _wrongEmail ? _showEmailErr : null,
              ),
              controller: _email,
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _password,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock_rounded),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _showPass = !_showPass;
                    });
                  }, 
                  icon: Icon( _showPass ? Icons.visibility_off_rounded : Icons.visibility_rounded),
                ),
                errorText: _wrongPass ? _showPassErr : null,
              ),
              obscureText: _showPass,
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _validate, 
                child: Text('LOGIN', 
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10)
                ),
              ),
            )
          ],
      ),
      )
    );
  }

}