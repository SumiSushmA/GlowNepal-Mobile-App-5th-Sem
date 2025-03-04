import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/stylist_model.dart';
import '../../domain/repository/stylist_repository.dart';

class StylistCubit extends Cubit<List<StylistModel>> {
  final StylistRepository _repository;

  StylistCubit(this._repository) : super([]);

  Future<void> loadStylists() async {
    try {
      print("🚀 Fetching stylists...");
      final stylists = await _repository.getStylists();
      print("✅ Stylists received: ${stylists.length}");

      emit(stylists);
    } catch (e) {
      print("❌ Error loading stylists: $e");
      emit([]); // Prevent crash, return empty list
    }
  }
}
