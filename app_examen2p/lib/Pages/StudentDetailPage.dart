import 'package:app_examen2p/Models/Character.dart';
import 'package:flutter/material.dart';
import '../utils/Global.dart';

class StudentDetailPage extends StatefulWidget {
  const StudentDetailPage({ Key? key }) : super(key: key);

  @override
  State<StudentDetailPage> createState() => _StudentDetailPageState();
}

class _StudentDetailPageState extends State<StudentDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: actualAlto,
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
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: 
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                height: 600,
              color: Global.colorNegroTransparente2,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ListView(children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(image: NetworkImage(getInfo(actualStudent.imageUrl)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(getInfo(actualStudent.name),
                            style: const TextStyle(
                                        fontSize: 22.0,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                        fontFamily: 'RaleWay')),
                      ),
                      Text(getInfo(actualStudent.dateOfBirth),
                          style: const TextStyle(
                                      fontSize: 18.0,
                                      color: Global.colorBlancoTransparente2,
                                      fontFamily: 'RaleWay')),
                      Text(getInfo(actualStudent.species),
                          style: const TextStyle(
                                      fontSize: 18.0,
                                      color: Global.colorBlancoTransparente2,
                                      fontFamily: 'RaleWay')),
                      Text(getInfo(actualStudent.patronus),
                          style: const TextStyle(
                                      fontSize: 18.0,
                                      color: Global.colorBlancoTransparente2,
                                      fontFamily: 'RaleWay')),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Image(image: NetworkImage(getHouse(actualStudent.house))),
                      ),
                    ]
                  )
                ],),
              ),
            ),
          )
          
        )],
        ),
      )
    );
  }
}