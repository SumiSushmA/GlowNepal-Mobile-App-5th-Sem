import 'dart:io';

import 'package:flutter/services.dart';

class LocalImageServer {
  static Future<void> startServer() async {
    var server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
    print(
        "Local image server running at: http://${server.address.address}:${server.port}/");

    await for (var request in server) {
      if (request.uri.path == "/stylish3.jpg") {
        final ByteData imageData =
            await rootBundle.load("assets/images/stylish 3.jpg");
        final Uint8List bytes = imageData.buffer.asUint8List();

        request.response.headers.contentType = ContentType("image", "jpeg");
        request.response.add(bytes);
        await request.response.close();
      } else {
        request.response.statusCode = HttpStatus.notFound;
        await request.response.close();
      }
    }
  }
}
