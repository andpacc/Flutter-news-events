import 'dart:typed_data';

abstract class DownloadService {
  void downloadMapAsJson({
    required Map<String, dynamic> map,
    String? filename,
  });
  void downloadAsFile({
    required Uint8List data,
    required String mediaType,
    String? filename,
  });
}
