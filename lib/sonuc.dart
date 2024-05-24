import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
    late bool oyunsonucu;

    SonucEkrani({required this.oyunsonucu});

    @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override

    String butonyazisi="";

  var mutlu_resim= Image.asset("resimler/mutlu_resim.png");
 var uzgun_resim=  Image.asset("resimler/uzgun_resim.png");

      Widget build(BuildContext context) {
        double screenWidth=MediaQuery.of(context).size.width;
        double screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: Text("Sonuç"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://st3.depositphotos.com/30440304/32830/i/450/depositphotos_328309378-stock-illustration-brushed-painted-abstract-background-brush.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [




              ((){
                if(widget.oyunsonucu==true){
                  butonyazisi="Tekrar Oyna";
                  return Column(
                    children: [
                      mutlu_resim,
                      Text("Kazandınız",
                        style: TextStyle(fontSize: screenWidth/15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  );
                }
                if(widget.oyunsonucu==false){
                  butonyazisi="Hadi Tekrar Deneyelim";
                  return Column(
                    children: [
                      uzgun_resim,
                      Text("Kaybettiniz",
                        style: TextStyle(fontSize: screenWidth/15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  );
                }

              }())!,





              SizedBox(
                height: screenHeight/15,
                child: OutlinedButton(onPressed: (){
                  Navigator.pop(context);
                },
                  style: ButtonStyle(

                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                  ),


                    child: Text(butonyazisi,
                    style: TextStyle(fontSize: screenWidth/15),)),
              ),
               ],

          ),
        ),
      ),
    );
  }
}



