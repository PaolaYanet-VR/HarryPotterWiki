import 'package:animate_do/animate_do.dart';
import 'package:app_examen2p/Models/Character.dart';
import 'package:app_examen2p/Pages/StudentDetailPage.dart';
import 'package:app_examen2p/utils/Global.dart';
import 'package:flutter/material.dart';
import '../Services/CharactersServices.dart';

class GryffindorPage extends StatefulWidget {
  const GryffindorPage({Key? key}) : super(key: key);

  @override
  _GryffindorPageState createState() => _GryffindorPageState();
}

class _GryffindorPageState extends State<GryffindorPage> {

  CharactersServices charactersServices = CharactersServices();
  bool cargando = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
                  'Gryffindor',
                  style: TextStyle(color: Colors.white, fontFamily: 'RaleWay')
                ),
        backgroundColor: Global.colorGryffindorAlto,
      ),
      body: FutureBuilder(
        future: charactersServices.getStudentsByHouse("gryffindor"),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(!snapshot.hasData){
            return Container(
              color: Global.colorGryffindorBajo,
              child: const Center(
                child: Text(
                  'Loading...',
                  style: TextStyle(color: Colors.white, fontFamily: 'RaleWay')
                )
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.requireData.length,
            itemBuilder: (BuildContext context, int index){
              return Container(
                color: Global.colorGryffindorBajo,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: FadeInDownBig(
                      child: Container(
                        height: 90,
                        alignment: Alignment.center,
                        color: Global.colorGryffindorTransparente,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Global.colorGryffindorBajo,
                              radius: 30,
                              backgroundImage: NetworkImage(snapshot.requireData[index].imageUrl),
                            ),
                            title: Text(
                              snapshot.requireData[index].name,
                              style: const TextStyle(color: Colors.white, fontFamily: 'RaleWay')
                              ),
                            onTap: (){
                              actualStudent = snapshot.requireData[index];
                              actualAlto = Global.colorGryffindorAlto;
                              actualMedio = Global.colorGryffindorMedio;
                              actualBajo = Global.colorGryffindorBajo;
                              actualTransparente = Global.colorGryffindorTransparente;

                              Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => const StudentDetailPage()));
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}