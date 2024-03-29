import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TerminosYcondiciones extends StatelessWidget {
  const TerminosYcondiciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Términos y condiciones",
        ),
      ),
      body: const Center(
        child: Markdown(
            data:
                """ # Términos y Condiciones de Uso para "Castellón365Events: Tu Guía de Eventos"

## 1. Aceptación de los Términos y Condiciones

Al acceder y utilizar la aplicación "Castellón365Events", aceptas cumplir con los términos y condiciones presentes en este documento. Si no estás de acuerdo con alguno de estos términos, no utilices esta aplicación.

## 2. Uso de la Aplicación

Te otorgamos una licencia limitada, no exclusiva, intransferible y revocable para utilizar "Castellón365Events" para tu uso personal y no comercial. No tienes derecho a modificar, distribuir, vender, o crear trabajos derivados de la aplicación sin nuestro consentimiento expreso por escrito.

## 3. Exención de Responsabilidad

"Castellón365Events" se proporciona "tal cual" sin garantías de ningún tipo, ya sean explícitas o implícitas. No garantizamos que la información de eventos y noticias sea siempre precisa, completa o actual. No asumimos responsabilidad por cualquier daño que pueda resultar de tu uso de la aplicación.

## 4. Contenido de Terceros

"Castellón365Events" puede contener enlaces a sitios web de terceros o servicios que no son propiedad ni están controlados por nosotros. No tenemos control sobre, y no asumimos ninguna responsabilidad por el contenido, las políticas de privacidad, o las prácticas de los sitios web o servicios de terceros.

## 5. Modificaciones

Podemos modificar estos términos y condiciones en cualquier momento. Si hacemos cambios, te notificaremos publicando los términos actualizados en la aplicación. Tu uso continuado de "Castellón365Events" después de cualquier cambio en estos términos implica tu aceptación de los términos revisados.

## 6. Legislación y Jurisdicción

Estos términos y condiciones se rigen por las leyes de España. Cualquier disputa relacionada con estos términos y condiciones será resuelta por los tribunales de Castellón de la Plana.

Fecha de última actualización: 17 de mayo de 2023
   """),
      ),
    );
  }
}
