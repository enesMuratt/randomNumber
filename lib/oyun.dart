import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin_oyunu/sonuc.dart';
import 'dart:math';

class Oyun extends StatefulWidget {
  @override
  State<Oyun> createState() => _OyunState();
}



class _OyunState extends State<Oyun> {


  bool goster=true;
  int radiocontrol = 0;
  var sayi = Random();
  var tfcontrol = TextEditingController();
  var yonlendirme = "";
  var kalanhak = 5;
  int s = 0;
  int x=0;//  for show selected radiobutton on snackbar
  @override
  Widget build(BuildContext context) {
    print(sayi);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: Text("Tahmin Et"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://st3.depositphotos.com/30440304/32830/i/450/depositphotos_328309378-stock-illustration-brushed-painted-abstract-background-brush.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.green.shade200,
                width: screenWidth / 3,
                child: Text(
                  "Kalan Hak: ${kalanhak}",
                  style: TextStyle(fontSize: screenWidth / 18),
                ),
              ),
              Text(
                "${yonlendirme}",
                style: TextStyle(fontSize: screenWidth / 20),
              ),

              // ((){
              //   var maxnumber=1;
              //
              //   var dificulty;
              //   if(dificulty==1){
              //    return maxnumber=21;
              //   }
              //   if(dificulty==2){
              //    return maxnumber=51;
              //   }
              //   if(dificulty==3){
              //     return maxnumber=101;
              //   }
              // }())!,

             Visibility(
              visible: goster,
               child: TextButton(

                 child:
                 Text("Zorluk Seç"),


                 onPressed: (){

                   showDialog(context: context,
                       builder:(BuildContext context){
                         return AlertDialog(
                           title: Text("Zorluk Seç"),
                           actions: [
                             RadioListTile(
                                title: Text("Kolay"),
                                value: 1,
                                groupValue: radiocontrol,
                                onChanged: (veri) {
                                  x=1;
                                  setState(() {
                                    s = (sayi.nextInt(11));

                                    radiocontrol = veri!;
                                  });
                                  print(s);
                                }),

                             RadioListTile(
                                title: Text("Orta"),
                                value: 2,
                                groupValue: radiocontrol,
                                onChanged: (veri) {
                                  x=2;
                                  setState(() {
                                    s = (sayi.nextInt(51));

                                    radiocontrol = veri!;
                                  });
                                  print(s);
                                }),
                             RadioListTile(
                                title: Text("Zor"),
                                value: 3,
                                groupValue: radiocontrol,
                                onChanged: (veri) {
                                  x=3;
                                  setState(() {
                                    s = (sayi.nextInt(101));
                                    radiocontrol = veri!;
                                  });
                                  print(s);
                                }),

                             TextButton(onPressed: (){
                               Navigator.pop(context);
                              goster=false;

                               if(x==1){
                                 ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(content: Text("Kolay Mod Seçildi"),),
                                 );
                                 return;
                               }
                               if (x==2){
                                 ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(content: Text("Orta Seviye Seçildi"),),
                                 );
                                 return;
                               }
                               if(x==3){
                                 ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(content: Text("Zor Seviye Seçildi"),),
                                 );
                                 return;
                               }
                             },
                                 child:
                                 Text("Seçim Yap")),
                           ],
                         );
                       }


                   );
                 },
               ),

             ),





              Padding(
                padding: EdgeInsets.all(screenWidth / 40),
                child: TextField(
                  controller: tfcontrol,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Tahmininiz",
                  ),
                  autofocus: true,
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    kalanhak -= 1;
                  });

                  int tahmin = int.parse(tfcontrol.text);
                  if (s == tahmin) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SonucEkrani(
                                  oyunsonucu: true,
                                )));
                    return;
                  }
                  if (s < tahmin) {
                    setState(() {
                      yonlendirme = "Göklerde Uçma";
                    });
                  }
                  if (s > tahmin) {
                    setState(() {
                      yonlendirme = "Yerlerde Sürünme";
                    });
                  }

                  if (kalanhak == 0) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SonucEkrani(
                                  oyunsonucu: false,
                                )));
                  }
                  tfcontrol.text = "";
                },
                child: Text(
                  "Tahmin Et",
                  style: TextStyle(
                      fontSize: screenWidth / 20, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
