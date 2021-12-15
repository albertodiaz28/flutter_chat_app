import 'package:chat_app/widgets/boton_azul.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:chat_app/widgets/labels.dart';
import 'package:chat_app/widgets/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(titulo: 'Registro',),
                _Form(),
                Labels(ruta: 'login', texto: 'Inicia sesión', subtexto: '¿Ya tienes cuenta?',),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Text('Términos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200))
                ),
              ],
            ),
          ),
        ),
      )
   );
  }
}

class _Form extends StatefulWidget {

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final passwdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeholder:  'Nombre',
            textController: nameCtrl,
          ),
          SizedBox(height: 20,),
          CustomInput(
            icon: Icons.mail_outline,
            placeholder:  'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          SizedBox(height: 20,),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder:  'Password',
            isPassword: true,
            textController: passwdCtrl,
          ),
          SizedBox(height: 20,),
          BotonAzul(text: 'Log in', onPressed: (){})
        ],
      ),
    );
  }
}

