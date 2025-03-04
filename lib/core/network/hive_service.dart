import 'package:glownepal_mobile_app_5th_sem/app/constants/hive_table_constant.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/data/model/auth_hive_model.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/data/model/stylist_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  Future<void> init() async {
    // ✅ Initialize Hive Database
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // ✅ Register Hive Adapters if not already registered
    if (!Hive.isAdapterRegistered(AuthHiveModelAdapter().typeId)) {
      Hive.registerAdapter(AuthHiveModelAdapter());
    }
    if (!Hive.isAdapterRegistered(StylistModelAdapter().typeId)) {
      Hive.registerAdapter(StylistModelAdapter());
    }
  }

  // ========================== 🔹 USER QUERIES ==========================

  /// ✅ Add a user to the Hive database
  Future<void> addUser(AuthHiveModel user) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(user.studentId, user);
  }

  /// ✅ Delete a user from the Hive database
  Future<void> deleteUser(String id) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.delete(id);
  }

  /// ✅ Retrieve all users from Hive
  Future<List<AuthHiveModel>> getAllUsers() async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    return box.values.toList();
  }

  /// ✅ Authenticate a user based on email & password
  Future<AuthHiveModel?> loginUser(String email, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);

    try {
      return box.values.firstWhere(
          (element) => element.email == email && element.password == password);
    } catch (e) {
      return null;
    }
  }

  // ========================== 🔹 STYLIST QUERIES ==========================

  /// ✅ Add a stylist to the Hive database
  Future<void> addStylist(StylistModel stylist) async {
    var box = await Hive.openBox<StylistModel>(HiveTableConstant.stylistBox);
    await box.put(stylist.id, stylist);
  }

  /// ✅ Delete a stylist from the Hive database
  Future<void> deleteStylist(String id) async {
    var box = await Hive.openBox<StylistModel>(HiveTableConstant.stylistBox);
    await box.delete(id);
  }

  /// ✅ Retrieve all stylists from Hive
  Future<List<StylistModel>> getAllStylists() async {
    var box = await Hive.openBox<StylistModel>(HiveTableConstant.stylistBox);
    return box.values.toList();
  }
}
