import 'package:banco_digital/item_transferencia.dart';
import 'package:banco_digital/models/transferencia.dart';
import 'package:banco_digital/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Transferências";

class ListaTransferencias extends StatefulWidget {
  ListaTransferencias({Key? key}) : super(key: key);
  final List<Transferencia> _transferencias = [];


  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice){
          final transferencia = widget._transferencias[indice];
          debugPrint('chegouNoItemBuilder');
          debugPrint('$transferencia');
          debugPrint(widget._transferencias.length.toString());
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed:  () {
          dynamic future = Navigator.push(context, MaterialPageRoute(builder: (context){
            return const FormularioTransferencia();
          }));
          future.then((transferenciaRecebida){
            debugPrint('chegou no then do future');
            debugPrint('$transferenciaRecebida');
            if(transferenciaRecebida != null){
              _atualiza(transferenciaRecebida);
            }

          });
        },
      ),
    );
  }
  void _atualiza(Transferencia transferenciaRecebida){
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
}