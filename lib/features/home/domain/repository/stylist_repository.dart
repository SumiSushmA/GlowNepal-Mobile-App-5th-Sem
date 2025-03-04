import 'package:glownepal_mobile_app_5th_sem/features/home/data/data_source/stylist_remote_data_source.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/data/model/stylist_model.dart';

abstract class StylistRepository {
  Future<List<StylistModel>> getStylists();
}

class StylistRepositoryImpl extends StylistRepository {
  final StylistRemoteDataSource remoteDataSource;

  StylistRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<StylistModel>> getStylists() async {
    return await remoteDataSource.fetchStylists();
  }
}
