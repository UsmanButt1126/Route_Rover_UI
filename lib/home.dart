import 'package:flutter/material.dart';
import 'package:route_tracking_ui/login.dart';
import 'package:route_tracking_ui/util/RouteName.dart';

import 'custom/custombutton.dart';

class SelelctUser extends StatefulWidget {
  const SelelctUser({super.key});

  @override
  State<SelelctUser> createState() => _SelelctUserState();
}

class _SelelctUserState extends State<SelelctUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body: Column(
         children: [
           Expanded(
             flex: 1,
               child: Container(
                 child: Image.asset("Assets/images/login/login 2.png")
               )),
           Expanded(
               flex:1,
               child: Container(
                 child: Center(
                   child: Column(
                     children: [
                       button("Log in as Admin", Colors.teal,
                           (){
                         Navigator.pushNamed(context, RouteName.admin);
                           },
                          const TextStyle(fontSize: 21 ,
                               color: Colors.black ,
                               fontWeight: FontWeight.w700)  ,context ),
                       SizedBox(height: 15),
                       button("Login as user", Colors.teal,
                               (){
                         Navigator.pushNamed(context, RouteName.login);
                       },
                       const    TextStyle(fontSize: 21 ,
                               color: Colors.black ,
                               fontWeight: FontWeight.w700), context)
                     ],
                   ),
                 ),
               )),
         ],
       ),
    );
  }

}
