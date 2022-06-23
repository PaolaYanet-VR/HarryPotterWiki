import 'package:app_examen2p/Models/User.dart';
import 'package:app_examen2p/utils/Global.dart';
import 'package:app_examen2p/widgets/NavigationMenu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    createUser('Pola', '707', 'https://i.pinimg.com/564x/ba/7e/a4/ba7ea4523ca2a9c06492b608983ad8e4.jpg');

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Global.colorBase
        ),
        body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage("https://i.pinimg.com/564x/d7/81/17/d7811712a9ed4822e1b66f484a6d9408.jpg"),
          ),
        ),
        child: Column(
          children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: 
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
              color: Global.colorNegroTransparente,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ListView(children: [
                  Column(
                    children: const [
                      Text('Welcome to',
                          style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontFamily: 'RaleWay')),
                      Image(image: NetworkImage('https://th.bing.com/th/id/R.4318089b52eb3a413f0c04bb85151c6d?rik=E5WxnAb3CrG8rA&pid=ImgRaw&r=0')),
                      Text('wiki',
                          style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontFamily: 'RaleWay')),
                      Padding(
                        padding: EdgeInsets.only(top: 50, left: 10, right: 10),
                        child: Image(image: NetworkImage('https://imagensemoldes.com.br/wp-content/uploads/2020/06/Perfeito-Bras%C3%A3o-Harry-Potter-PNG-1024x1024.png')),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 45),
                        child: Text('by ©RedVille',
                            style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                        fontFamily: 'RaleWay')),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text('APIs',
                            style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                        fontFamily: 'Arial')),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('fedeperin/harry-potter-api',
                            style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                        fontFamily: 'RaleWay')),
                      ),
                      Text('hp-api.herokuapp.com',
                          style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontFamily: 'RaleWay')),
                    ],
                  )
                ],),
              ),
            ),
          )
          )
        )],
        ),
      ),
        drawer: const NavigationMenu(),
      )
    );
  }
}