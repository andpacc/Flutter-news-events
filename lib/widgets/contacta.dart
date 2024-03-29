import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Contacta extends StatelessWidget {
  const Contacta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contacta",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Column(
            children: <Widget>[
              const Text('Correo Electronico: Castellón365EventS@gmail.com'),
              TextButton.icon(
                icon: const Icon(Icons.mail),
                label: const Text("Enviar correo"),
                onPressed: () async {
                  const email = 'mailto:Castellón365Events@gmail.coms';
                  launchUrlString(email);
                },
              ),
              const SizedBox(height: 20),
              const Text('Telefono : 66699966'),
              TextButton.icon(
                icon: const Icon(Icons.phone),
                label: const Text("Realizar llamada"),
                onPressed: () async {
                  const phoneNumber = 'tel:66699966';
                  launchUrlString(phoneNumber);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
