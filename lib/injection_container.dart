import 'package:get_it/get_it.dart';
import 'package:goldcity/config/data/local_manager.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/config/data/shared_manager.dart';
import 'package:goldcity/data/repository/lead/lead_repository_impl.dart';
import 'package:goldcity/data/repository/project/project_repository_impl.dart';
import 'package:goldcity/data/repository/project_detail/project_detail_repository_impl.dart';
import 'package:goldcity/data/source/local/project/project_local_data_source.dart';
import 'package:goldcity/data/source/remote/lead/lead_remote_data_source.dart';
import 'package:goldcity/data/source/remote/project/project_remote_data_source.dart';
import 'package:goldcity/data/source/remote/project_detail/project_detail_remote_data_source.dart';
import 'package:goldcity/domain/repository/lead/lead_repository.dart';
import 'package:goldcity/domain/repository/project/project_repository.dart';
import 'package:goldcity/domain/repository/project_detail/project_detail_repository.dart';
import 'package:goldcity/domain/usecase/lead_usecase.dart';
import 'package:goldcity/domain/usecase/project_detail_usecase.dart';
import 'package:goldcity/domain/usecase/project_usecase.dart';

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton(() => RemoteManager());

  locator.registerLazySingleton(() => LeadUseCase());
  locator.registerLazySingleton(() => ProjectUseCase());
  locator.registerLazySingleton(() => ProjectDetailUseCase());
  locator.registerLazySingleton(() => LocalManager());
  locator.registerLazySingleton(() => SharedManager());

  locator.registerLazySingleton<LeadRepository>(() => LeadRepositoryImpl());
  locator.registerLazySingleton<LeadRemoteDataSource>(
      () => LeadRemoteDataSourceImpl());

  locator
      .registerLazySingleton<ProjectRepository>(() => ProjectRepositoryImpl());
  locator.registerLazySingleton<ProjectRemoteDataSource>(
      () => ProjectRemoteDataSourceImpl());
  locator.registerLazySingleton<ProjectLocalDataSource>(
      () => ProjectLocalDataSourceImpl());

  locator.registerLazySingleton<ProjectDetailRepository>(
      () => ProjectDetailRepositoryImpl());

  locator.registerLazySingleton<ProjectDetailRemoteDataSource>(
      () => ProjectDetailRemoteDataSourceImpl());
}
