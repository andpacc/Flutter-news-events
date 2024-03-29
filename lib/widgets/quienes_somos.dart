import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class QuienesSomos extends StatelessWidget {
  const QuienesSomos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quienes Somos",
        ),
      ),
      body: const Center(
        child: Markdown(data: """ # Quiénes Somos

Bienvenidos a **Castellón365Events**, somos un equipo apasionado por conectar a las personas con los eventos que suceden en Castellón y sus alrededores.

## Nuestro Objetivo

Nuestro objetivo principal es proporcionar una plataforma integral y fácil de usar que te permita descubrir, explorar y participar en eventos en Castellón y su entorno cercano. Creemos firmemente que los eventos son una excelente manera de conectar con tu comunidad y descubrir nuevas experiencias y oportunidades.

Además de eventos locales, **Castellón365Events** te brinda acceso a noticias nacionales e internacionales, manteniéndote al tanto de lo que está sucediendo en el mundo. 

## Apoyando a los Artistas Locales

Como parte de nuestro compromiso con la comunidad local, **Castellón365Events** también funciona como una plataforma para que los artistas de Castellón compartan su música y alcancen a una audiencia más amplia. Creemos en el potencial de nuestra ciudad y en el talento que reside en ella, y estamos comprometidos en proporcionar un espacio para que este talento brille.

## Únete a nosotros

Te invitamos a unirte a **Castellón365Events** y a empezar a explorar todo lo que Castellón tiene para ofrecer. Estamos emocionados por tener la oportunidad de servirte y estamos ansiosos por contribuir a que nuestra hermosa ciudad sea aún más vibrante.

Únete a nosotros en este viaje, mientras celebramos 365 días de eventos, música, noticias y mucho más con **Castellón365Events**.

   """),
      ),
    );
  }
}
