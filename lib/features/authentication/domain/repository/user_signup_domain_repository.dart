import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:glownepal_mobile_app_5th_sem/core/error/failure.dart';

import '../entity/user_signup_entity.dart';

abstract class UserSignupDomainRepository {
  Future<void> createUser(UserSignupEntity userEntity);
  Future<UserSignupEntity?> getUserByEmail(String email);
  Future<bool> isEmailRegistered(String email);
  Future<void> deleteUser(String email);
  Future<Either<Failure, String>> uploadImage(File file);
}
