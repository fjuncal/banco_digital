import 'package:banco_digital/components/editor.dart';
import 'package:banco_digital/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Criando Transferência";

const _rotuloCampoValor = "Valor";
const _dicaCampoValor = "0.00";

const _rotuloCampoConta = "Número da Conta";
const _dicaCampoConta = "00000";

const _textoBotaoConfirmar = "Confirmar";

class FormularioTransferencia extends StatefulWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia>{
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(controlador: _controladorCampoNumeroConta, dica: _dicaCampoConta, rotulo: _rotuloCampoConta,),
              Editor(controlador: _controladorCampoValor, dica: _dicaCampoValor, rotulo: _rotuloCampoValor, icone: Icons.monetization_on,),
              ElevatedButton(
                child: const Text(_textoBotaoConfirmar),
                onPressed: () {
                  _criaTransferencia(context);
                },
              )
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context){
    final String numeroConta = _controladorCampoNumeroConta.text;
    final String valor = _controladorCampoValor.text;
    debugPrint('criando transferencia');
    if(numeroConta != "" && valor != ""){
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
      debugPrint('entrando p navegar - $transferenciaCriada');

    }
  }
}