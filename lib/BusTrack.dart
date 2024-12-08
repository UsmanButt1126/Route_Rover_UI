import 'package:flutter/material.dart';
import 'package:route_tracking_ui/BusRecommendation.dart';
import 'package:route_tracking_ui/custom/customContainer.dart';
import 'package:route_tracking_ui/util/RouteName.dart';

class BusTrack extends StatefulWidget {
  final Map<String , String>? data;

    BusTrack({super.key,
      this.data,
  });

  @override
  State<BusTrack> createState() => _PassHomeState();
}

class _PassHomeState extends State<BusTrack> {

  @override
  Widget build(BuildContext context) {
    final where =  widget.data?['from']??"Unkonwn";
    final destination = widget.data?['to'] ?? "unknown";
    return Scaffold(
      body: Column(
        children: [
          container(
              Height: MediaQuery.of(context).size.height * 0.5,
              Width: MediaQuery.of(context).size.width * 1 ,
              child: const Image(
                image: AssetImage("Assets/images/tracking/realTracking.png"),
                fit: BoxFit.fill,
              )),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              container(
                  Height: MediaQuery.of(context).size.height * 0.30,
                  Width: MediaQuery.of(context).size.width * 0.45,
                  boxdecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),

                      border: Border.all(width: 1, color: Colors.black)),
                  child:   SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text("Bus Detail",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 21)),
                        SizedBox(
                          height: 15,
                        ),
                        CircleAvatar(backgroundImage:
                        NetworkImage("data:image/jpeg;base64,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"),),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:8.0),
                          child: Row(
                            children: [
                              Text("Name : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              SizedBox(
                                width: 25,
                              ),
                              Text(widget.data!['busName']!),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:8.0),
                          child: Row(
                            children: [
                              Text("Number : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              SizedBox(
                                width: 9,
                              ),
                              Text("2154"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:8.0),
                          child: Text("Bus Route : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        ),
                        Text(" ${where} to  ${destination} ",style:
                          TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 18),)
                      ],
                    ),
                  )),
              const SizedBox(
                width: 15,
              ),
              container(
                  Height: MediaQuery.of(context).size.height * 0.30,
                  Width: MediaQuery.of(context).size.width * 0.45,
                  boxdecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),

                      border: Border.all(width: 1, color: Colors.black)),
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text("Driver Detail",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21)),
                      SizedBox(
                        height: 15,
                      ),
                      CircleAvatar(backgroundImage:
                      NetworkImage("data:image/jpeg;base64,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"),),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:8.0),
                        child: Row(
                          children: [
                            Text("Name : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            SizedBox(
                              width: 25,
                            ),
                            Text("Mushtaq"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:8.0),
                        child: Row(
                          children: [
                            Text("License  : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            SizedBox(
                              width: 8,
                            ),
                            Text("2154"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:8.0),
                        child: Row(
                          children: [
                            Text("Age : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            SizedBox(
                              width: 40,
                            ),
                            Text("2154"),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),SizedBox(height: 20,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Busrecommendation()));
            },
            child: container(Height: MediaQuery.of(context).size.height*0.05,
                Width: MediaQuery.of(context).size.width*0.9,

                boxdecoration: BoxDecoration(
                    color: Colors.teal,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Center(child: Text("Go Back", style: TextStyle(
                  fontSize: 21, fontWeight: FontWeight.bold
                ),))),
          )
        ],

      ),
    );
  }
}
