import 'dart:io';

import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin{

  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  List<ChatMessage> _messages = [];

  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Column(
          children: [
            CircleAvatar(
              child: Text('Te', style: TextStyle(fontSize: 12),),
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
            ),
            SizedBox( height: 3,),
            Text('Alberto Díaz', style: TextStyle( color: Colors.black87, fontSize: 12),)
          ],
        ),
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: [

            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: ( _, i ) => _messages[i],
                reverse: true,
              ),
            ),

            Divider(height: 1,),

            Container(
              color: Colors.white,
              height: 60,
              child: _inputChat(),
            )
          ],
        )
      ),
   );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric( horizontal: 8.0 ),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: ( String texto ){
                  setState(() {
                    if ( texto.trim().length > 0 ) {
                      _estaEscribiendo = true;
                    } else {
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mensaje'
                ),
                focusNode: _focusNode,
              ),
            ),

            Container(
              child: Platform.isIOS
               ? CupertinoButton(
                  child: Text('Enviar'), 
                  onPressed: _estaEscribiendo
                      ? () => _handleSubmit( _textController.text.trim() )
                      : null,
                 )
               : Container(
                 child: IconTheme(
                   data: IconThemeData( color: Colors.blue[400] ),
                   child: IconButton(
                     highlightColor: Colors.transparent,
                     splashColor: Colors.transparent,
                     onPressed: _estaEscribiendo
                      ? () => _handleSubmit( _textController.text.trim() )
                      : null,
                     icon: Icon( Icons.send)
                    ),
                 ),
               )
            )
          ],
        ),
      ),
    );
  }

  _handleSubmit( String texto ) {
    if ( texto.length == 0 ) return;

    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = new ChatMessage(
      texto: texto, 
      uid: '123', 
      animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 200)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _estaEscribiendo = false;
    });

  }

  @override
  void dispose() {
    //TODO: Off del socket
    for( ChatMessage message in _messages ){
      message.animationController.dispose();
    }

    super.dispose();
  }
}