import 'package:cinemapedia_b/infraestructure/datasources/isar_datasource.dart';
import 'package:cinemapedia_b/infraestructure/repositories/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider((ref){
  return LocalStorageRepositoryImpl(IsarDatasource());
});