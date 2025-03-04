import 'package:glownepal_mobile_app_5th_sem/features/home/data/model/stylist_model.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/domain/repository/stylist_repository.dart';

class GetStylistsUseCase {
  final StylistRepository repository;

  GetStylistsUseCase(this.repository);

  Future<List<StylistModel>> execute() async {
    return await repository.getStylists();
  }
}
