import 'package:flutter/material.dart';
import 'package:sayi_tahmin_oyunu/oyun.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: anasayfa(),
    );
  }
}

class anasayfa extends StatefulWidget {



  @override
  State<anasayfa> createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {


  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.pink.shade100,
        title: Text("Başlangıç"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://st3.depositphotos.com/30440304/32830/i/450/depositphotos_328309378-stock-illustration-brushed-painted-abstract-background-brush.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(

            children: [
                Padding(
                  padding:  EdgeInsets.only(left: screenWidth/3.5,right: screenWidth/3.5,top: screenHeight/15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.shade100,
                      borderRadius: BorderRadius.all(Radius.circular(screenWidth/15)),
                    ),

                    width: screenWidth/3,
                    height: screenHeight/10,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Sayı Tahmin \n Oyunu",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: screenWidth/20,
                        ),
                      ),
                    ),
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenHeight/10),
                    child:Align(
                      alignment: Alignment.center,
                      child: Image.asset("resimler/zar_resim.png"),
                    ),
                  ),


              SizedBox(
                width: screenHeight/6,
                height: screenHeight/6,
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                  child: Text("Oyuna\nBaşla",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white,
                    fontSize: screenHeight/38,
                   ),
                  ),
                  onPressed: ()
    {Navigator.push(context,
    MaterialPageRoute(builder: (context)=>Oyun()));

    }
    ),



                ),



              ],
            ),
        ),
      ),






    );
  }
}
