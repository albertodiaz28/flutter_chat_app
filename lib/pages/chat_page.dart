import 'package:flutter/material.dart';


class ChatPage extends StatelessWidget {

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
                itemBuilder: ( _, i ) => Text('$i'),
                reverse: true,
              ),
            ),

            Divider(height: 1,),

            Container(
              color: Colors.white,
              height: 100,
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

          ],
        ),
      ),
    );
  }
}