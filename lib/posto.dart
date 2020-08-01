import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Posto extends StatefulWidget {
  @override
  _PostoState createState() => _PostoState();
}

class _PostoState extends State<Posto> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController gas = TextEditingController();
  String res = 'resultado';
  String mostrar = '';
  void escolha(String alc , String gas){
    print('recebi $alc  e o $gas');
    List esc = [];
    esc.add(alc);
    esc.add(gas);
    res = esc[Random().nextInt(2)];
    setState(() {
      mostrar = 'com base em porra nem uma escolha $res';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Álcool ou gasolina'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(10, 30, 10, 20),
                      child: Image.asset('images/logo.png'),),
            Padding(padding: EdgeInsets.fromLTRB(20, 30, 20,50),
                      child:Column(
                        children: <Widget>[
                          Text('saiba qual é a melhor opção para abastecimento do seu carro',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                              textAlign: TextAlign.justify),
                          TextField(
                              keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Preço Alccol, Ex 1.59'
                            ),
                           onSubmitted: (String alc){
                                  print('valor alcool $alc');
                            },
                            controller: _textEditingController,// vai enviar
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: 'Preço gasolina, Ex 5.4'
                            ),
                            onSubmitted: (String gas){

                            },
                            controller: gas,
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: ButtonTheme(
                            minWidth: double.infinity,
                            height: 40,
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: (){
                                  print('alcool  ${_textEditingController.text}    gasolina ${gas.text}' );
                                  escolha(_textEditingController.text , gas.text);
                              },
                              child: Text('calcular',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),),
                          ),),
                          Text(mostrar)
                        ],
                      )
              ),

          ],
        ),
      ),
    );
  }
}