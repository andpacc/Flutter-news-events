import 'package:flutter/services.dart';

class DeeplinkStructure {
  static const deepLinkEventStream = EventChannel('deeplink.com/events');
  static const platform = MethodChannel('deeplink.com/channel');

  static Future<void> initDeepLinks(
      {required Function(Uri uri) onRedirected,
      required bool hasDeeplinkAlready}) async {
    // se tiene que definir antes que el startUri
    deepLinkEventStream.receiveBroadcastStream().listen(
          (deepLink) => _onRedirected(
            deepLink,
            onRedirected,
          ),
        );

    //el if se necesita para que no entre en bucle
    if (hasDeeplinkAlready) {
      var link = await _startUri();
      _onRedirected(
        link,
        onRedirected,
      );
    }
    // }
  }

  static Future<dynamic> _startUri() async {
    try {
      return platform.invokeMethod('initialLink');
    } on PlatformException catch (e) {
      return "Failed to Invoke: '${e.message}'.";
    }
  }

  static void _onRedirected(
    String url,
    Function(
      Uri uri,
    )
        onRedirected,
  ) {
    final uri = Uri.tryParse(url);
    if (uri != null) {
      onRedirected.call(uri);
    }
  }
}
