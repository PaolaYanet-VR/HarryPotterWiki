import 'package:app_examen2p/Models/User.dart';
import 'package:app_examen2p/Pages/GriffindorPage.dart';
import 'package:app_examen2p/Pages/HufflepuffPage.dart';
import 'package:app_examen2p/Pages/RavenclawPage.dart';
import 'package:app_examen2p/Pages/SlytherinPage.dart';
import 'package:app_examen2p/Pages/SpellsPage.dart';
import 'package:app_examen2p/utils/Global.dart';
import 'package:flutter/material.dart';

import '../Pages/LogInPage.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Global.colorBase,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Global.colorNegro,
                        backgroundImage: NetworkImage(
                          actualUser.image,
                          scale: 0.1
                          ),
                      ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                actualUser.username,
                textScaleFactor: 1.3,
                style: const TextStyle(color: Colors.white, fontFamily: 'RaleWay'),
              ),
            ),
          ),
          itemMenu(
            "Gryffindor", 
            "https://th.bing.com/th/id/R.9607751f192bbe3e68c01d5a7ed0752a?rik=6LBVN5jWuBP5YQ&pid=ImgRaw&r=0", 
            Global.colorGryffindorAlto, 
            context),
          itemMenu(
            "Slytherin", 
            "https://i.pinimg.com/originals/2d/78/5e/2d785e52fdb2a05d6a02ca930a067c6e.jpg", 
            Global.colorSlytherinBajo, 
            context),
          itemMenu(
            "Ravenclaw", 
            "https://e7.pngegg.com/pngimages/451/45/png-clipart-ravenclaw-wall-decor-harry-potter-ravenclaw-house-lord-voldemort-hogwarts-hermione-granger-harry-potter-retail-logo-thumbnail.png", 
            Global.colorRavenclawMedio, 
            context),
          itemMenu(
            "Hufflepuff", 
            "https://fontan.io/media/www.warnerbros.fr/323c9963.jpg", 
            Global.colorHufflepuffGris, 
            context),
          const Divider(
            thickness: 1.5,
          ),
          itemMenu(
            "Spells", 
            "https://cdn2.iconfinder.com/data/icons/harry-potter-colour-collection/60/19_-_Harry_Potter_-_Colour_-_Harrys_Wand-512.png", 
            Global.colorNegro, 
            context),
          itemMenu(
            getLoggedIn(),
            "https://static.thenounproject.com/png/2185221-200.png", 
            Global.colorHufflepuffGris, 
            context),
        
        ],
      ),
    );
  }
}

Widget itemMenu(String text, String image, Color color, BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                height: 70,
                alignment: Alignment.center,
                color: color,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: color,
                      backgroundImage: NetworkImage(
                        image,
                        scale: 0.1
                        ),
                    ),
                    title: Text(
                      text,
                      textAlign: TextAlign.end,
                      textScaleFactor: 1.1,
                      style: const TextStyle(color: Colors.white, fontFamily: 'RaleWay'),
                    ),
                    onTap: () {
                      switch (text) {
                        case "Gryffindor":
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => const GryffindorPage()));
                          break;
                        case "Slytherin":
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => const SlytherinPage()));
                          break;
                        case "Ravenclaw":
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => const RavenclawPage()));
                          break;
                        case "Hufflepuff":
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => const HufflepuffPage()));
                          break;
                        case "Spells":
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => const SpellsPage()));
                          break;
                        default:
                          if (getLoggedIn() == "LogIn") {
                            Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => LogInPage()));
                          }
                          else {
                            actualUser = User();
                            Navigator.of(context).pop();
                          }
                          break;
                      }
                    }),
                ),
            ),
            )
          );
  }