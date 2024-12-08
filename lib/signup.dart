import 'package:flutter/material.dart';
import 'package:route_tracking_ui/custom/customTextField.dart';
import 'package:route_tracking_ui/custom/custombutton.dart';
import 'package:route_tracking_ui/util/RouteName.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final fnamectrl = TextEditingController();
  final lnamectrl = TextEditingController();
  final emailctrl = TextEditingController();
  final passwordctrl = TextEditingController();
  
  Future<void> SaveUserData (String fname , String lname , String email  )async{

    SharedPreferences sh =await SharedPreferences.getInstance();
    int count = sh.getInt("count")??0;
    sh.setString('First_Name_$count', fname);
    sh.setString("Last_Name_$count", lname);
    sh.setString("Email_$count", email);
    sh.setInt('count', count+1);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100, ),
              Text("Sign Up" ,style: TextStyle(fontSize: 40 , fontWeight: FontWeight.bold),),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? " ,style: TextStyle(fontSize: 18),),
                  InkWell(onTap:(){
                    Navigator.pushNamed(context, RouteName.login);
                  },
                      child: Text("Login" , style: TextStyle(color: Colors.teal,
                          fontSize: 20, fontWeight: FontWeight.bold),)),
                 
                ],
              ),
              SizedBox(height: 80,),
              Padding(
                padding: const EdgeInsets.only(left: 12,right: 12,top: 12),
                child: Customtextfield(
                   cotroller  : fnamectrl,
                  hintText: "Enter First Name",
                  keyboardType:  TextInputType.text,
                  prefixIcon: Icons.person,
          
                ),
          
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                child: Customtextfield(
                  cotroller  : lnamectrl ,
                  hintText: "Enter Last Name",
                  keyboardType:  TextInputType.text,
                  prefixIcon: Icons.person,
          
                ),
          
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                child: Customtextfield(
                  cotroller  : emailctrl,
                  hintText: "Enter Email",
                  keyboardType:  TextInputType.emailAddress,
                  prefixIcon: Icons.email,
          
                ),
          
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                child: Customtextfield(
                  cotroller  : passwordctrl,
                  hintText: "Enter Password",
                  isPassword : true,
                  keyboardType:  TextInputType.visiblePassword,
                  prefixIcon: Icons.password,
                  suffixIcon: Icons.remove_red_eye,
          
                ),
          
              ),
              SizedBox(height: 25,),
              button("Sign up", Colors.teal, ( ) async {
                if(fnamectrl.text.isNotEmpty && lnamectrl.text.isNotEmpty && emailctrl.text.isNotEmpty && passwordctrl.text.isNotEmpty)   {
                  await SaveUserData(
                    fnamectrl.text,
                    lnamectrl.text,
                     emailctrl.text,
                  );
                };
                setState(() {
          
                });
          
          
                Navigator.pushNamed(context, RouteName.login);
              }
                  , TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.black), context),
          
            ],
          ),
        ),
      ),
    );
    
     
  }
}
