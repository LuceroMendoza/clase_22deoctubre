import "package:flutter/material.dart";
import 'package:flutter/services.dart';

void main() => runApp(ConversacionWhatsApp());

class ConversacionWhatsApp extends StatefulWidget {
  @override
  createState() => Estado();
}

class Estado extends State<ConversacionWhatsApp> {
  String mensaje = '';
  List<String> mensajes = [];
  TextEditingController nombreControlador = TextEditingController();

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leadingWidth: 70.0,
            toolbarHeight: 60.0,
            backgroundColor: Colors.green,
            title: const ListTile(
                title: Text("Susi",
                    style: TextStyle(fontSize: 27, color: Colors.white)),
                subtitle: Text("últ vez hoy a las 9:59",
                    style: TextStyle(fontSize: 14, color: Colors.white))),
            actions: [
              Icon(Icons.call),
              Icon(Icons.attach_file),
              Icon(Icons.more_vert)
            ],
            leading: CircleAvatar(
              radius: 2.0,
              backgroundImage: NetworkImage(
                  'https://ca-times.brightspotcdn.com/dims4/default/f34883a/2147483647/strip/true/crop/5398x4433+0+0/resize/840x690!/format/webp/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F91%2F7a%2F98d1df684b3aad63e18a7c1cee85%2F000030030002-6.jpg'),
            ),
          ),
          body: Stack(children: [
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://i.pinimg.com/236x/85/70/f6/8570f6339d3189c96e340d47a581d3b8.jpg'),
                        fit: BoxFit.cover))),
            ListView.builder(
                itemCount: mensajes.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    margin: EdgeInsets.only(top: 5, left: 110, right: 5),
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(218, 247, 166, 25),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(15))),
                    child: Text(mensajes[index]),
                  );
                }),
            Positioned(
                bottom: 5,
                child: Wrap(children: [
                  Container(
                    width: 310,
                    margin:
                        EdgeInsets.only(top: 5, left: 10, bottom: 10, right: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(15))),
                    child: TextField(
                        controller: nombreControlador,
                        decoration: InputDecoration(
                            icon: Icon(Icons.emoji_emotions_outlined),
                            labelText: "Escribe aquí...",
                            suffixIcon: Icon(Icons.camera_alt))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: FloatingActionButton(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        setState(() {
                          mensaje = nombreControlador.text;
                          mensajes.add('$mensaje');
                        });
                      },
                    ),
                  ),
                ]))
          ]),
        ),
      );
}
