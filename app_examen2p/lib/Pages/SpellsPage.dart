import 'package:app_examen2p/utils/Global.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import '../Services/CharactersServices.dart';

class SpellsPage extends StatefulWidget {
  const SpellsPage({Key? key}) : super(key: key);

  @override
  _SpellsPageState createState() => _SpellsPageState();
}

class _SpellsPageState extends State<SpellsPage> {

  CharactersServices charactersServices = CharactersServices();
  bool cargando = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
                  'Spells',
                  style: TextStyle(color: Colors.white, fontFamily: 'RaleWay')
                ),
        backgroundColor: Global.colorBase,
      ),
      body: FutureBuilder(
        future: charactersServices.getSpells(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(!snapshot.hasData){
            return Container(
              color: Global.colorNegro,
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
                color: Global.colorNegro,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      alignment: Alignment.center,
                      color: Global.colorNegroTransparente,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                            title: Text(
                              snapshot.requireData[index].spell,
                              style: const TextStyle(color: Colors.white, fontFamily: 'RaleWay')
                              ),
                            onTap: (){
                              CoolAlert.show(
                                  backgroundColor: Global.colorBase,
                                  confirmBtnColor: Global.colorGryffindorAlto,
                                  context: context,
                                  type: CoolAlertType.info,
                                  text: snapshot.requireData[index].spell + ': ' + snapshot.requireData[index].use,
                                );
                              //Global.mensaje(context, snapshot.requireData[index].use, snapshot.requireData[index].spell);
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