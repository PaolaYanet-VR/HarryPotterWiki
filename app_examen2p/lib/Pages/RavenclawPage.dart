import 'package:animate_do/animate_do.dart';
import 'package:app_examen2p/Models/Character.dart';
import 'package:app_examen2p/Pages/StudentDetailPage.dart';
import 'package:app_examen2p/utils/Global.dart';
import 'package:flutter/material.dart';
import '../Services/CharactersServices.dart';

class RavenclawPage extends StatefulWidget {
  const RavenclawPage({Key? key}) : super(key: key);

  @override
  _RavenclawPageState createState() => _RavenclawPageState();
}

class _RavenclawPageState extends State<RavenclawPage> {

  CharactersServices charactersServices = CharactersServices();
  bool cargando = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
                  'Ravenclaw',
                  style: TextStyle(color: Colors.white, fontFamily: 'RaleWay')
                ),
        backgroundColor: Global.colorRavenclawAlto,
      ),
      body: FutureBuilder(
        future: charactersServices.getStudentsByHouse("ravenclaw"),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(!snapshot.hasData){
            return Container(
              color: Global.colorRavenclawBajo,
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
                color: Global.colorRavenclawBajo,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: FadeInDownBig(
                      child: Container(
                        height: 90,
                        alignment: Alignment.center,
                        color: Global.colorRavenclawTransparente,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Global.colorRavenclawBajo,
                              radius: 30,
                              backgroundImage: NetworkImage(snapshot.requireData[index].imageUrl),
                            ),
                            title: Text(
                              snapshot.requireData[index].name,
                              style: const TextStyle(color: Colors.white, fontFamily: 'RaleWay')
                              ),
                            onTap: (){
                              actualStudent = snapshot.requireData[index];
                              actualAlto = Global.colorRavenclawAlto;
                              actualMedio = Global.colorRavenclawMedio;
                              actualBajo = Global.colorRavenclawBajo;
                              actualTransparente = Global.colorRavenclawTransparente;

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