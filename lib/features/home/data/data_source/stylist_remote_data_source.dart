import 'package:dio/dio.dart';

import '../model/stylist_model.dart';

class StylistRemoteDataSource {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "http://192.168.1.68:4000/api/admin/"));

  Future<List<StylistModel>> fetchStylists() async {
    try {
      final response = await _dio.get(
        "all-stylists",
        options: Options(
          headers: {
            "atoken":
                "eyJhbGciOiJIUzI1NiJ9.YWRtaW5AZXhhbXBsZS5jb21nbG93bmVwYWwxMjM.20WLhmKY8IdF-nUDv-nE6FvffwPdUsTa4Vh9HFUG8k8", // Replace with correct token dynamically
          },
        ),
      );

      print("Response: ${response.data}");

      if (response.statusCode == 200 && response.data["success"] == true) {
        return (response.data["stylists"] as List)
            .map((json) => StylistModel.fromJson(json))
            .toList();
      } else {
        throw Exception(
            "Failed to fetch stylists: ${response.data["message"]}");
      }
    } catch (e) {
      print("Error in fetchStylists: $e");
      return []; // Instead of throwing an exception, return an empty list
    }
  }
}
