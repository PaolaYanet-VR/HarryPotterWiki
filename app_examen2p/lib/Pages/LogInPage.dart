import 'package:animate_do/animate_do.dart';
import 'package:app_examen2p/Models/User.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import '../utils/Global.dart';
import '../widgets/ButtonWidget.dart';
import '../widgets/TextFieldWidget.dart';

class LogInPage extends StatelessWidget {
   LogInPage({ Key? key }) : super(key: key);

  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Global.colorBase,
      ),
      body: Container(decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage("https://i.pinimg.com/564x/d7/81/17/d7811712a9ed4822e1b66f484a6d9408.jpg"),
          ),
        ),
        child: FadeInDown(
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
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Text('LogIn',
                              style: TextStyle(
                                          fontSize: 30.0,
                                          color: Colors.white,
                                          fontFamily: 'RaleWay')),
                        ),
                        const Padding(
                        padding: EdgeInsets.only(bottom: 30, left: 10, right: 10),
                        child: Image(image: NetworkImage('https://imagensemoldes.com.br/wp-content/uploads/2020/06/Perfeito-Bras%C3%A3o-Harry-Potter-PNG-1024x1024.png')),
                        ),
                        textFieldCustom('Username', _controllerUsername, true),
                        textFieldCustom('Password', _controllerPassword, false),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ButtonWidget(
                            title: 'LogIn',
                            height: 50,
                            textSize: 1.1,
                            textAlign: TextAlign.center,
                            color: Global.colorGryffindorAlto,
                            onPressed: () {
                              String mensaje = '';
                              if (_controllerUsername.text.isEmpty) {
                                mensaje += 'Username ';
                              }
                              if (_controllerPassword.text.isEmpty) {
                                mensaje += '- Password\n';
                              }
                      
                              if (_controllerUsername.text.isEmpty || _controllerPassword.text.isEmpty ) {
                                CoolAlert.show(
                                  backgroundColor: Global.colorBase,
                                  confirmBtnColor: Global.colorGryffindorAlto,
                                  context: context,
                                  type: CoolAlertType.warning,
                                  text: 'Empty Fields: ' + mensaje,
                                );
                              }
                              if (_controllerUsername.text.isNotEmpty && _controllerPassword.text.isNotEmpty) {
                                bool encontro = false;

                                for (var element in users) {
                                  if (element.username == _controllerUsername.text && element.password == _controllerPassword.text) {
                                    //Inicia sesión
                                    actualUser = element; 
                                    encontro = true;

                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  }
                                }

                                if (!encontro) {
                                  //Credenciales incorrectas
                                  CoolAlert.show(
                                    backgroundColor: Global.colorBase,
                                    confirmBtnColor: Global.colorGryffindorAlto,
                                    context: context,
                                    type: CoolAlertType.error,
                                    text: 'Wrong credentials',
                                  );
                                }
                              }
                            },
                          ),
                        )
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
      )
    );
  }
}

Widget textFieldCustom(String texto, TextEditingController textEditingController, bool isVisible) {
    return 
      Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: 
                  TextFieldWidget(
                    hintText: texto,
                    isVisible: isVisible,
                    isMyControllerActivate: true,
                    controller: textEditingController,
                    onChanged: (String value) {
                      //
                    },
                  ),
                );
  }