import 'package:get_it/get_it.dart';
import 'package:goldcity/config/data/local_manager.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/config/data/shared_manager.dart';
import 'package:goldcity/config/firebase/fcm_manager.dart';
import 'package:goldcity/data/repository/announcement/announcement_repository_impl.dart';
import 'package:goldcity/data/repository/complex/complex_repository_impl.dart';
import 'package:goldcity/data/repository/complex_detail/complex_detail_repository_impl.dart';
import 'package:goldcity/data/repository/contact/contact_repository_impl.dart';
import 'package:goldcity/data/repository/education/education_repository_impl.dart';
import 'package:goldcity/data/repository/shareable_page/shareable_page_repository_impl.dart';
import 'package:goldcity/data/repository/webinar/webinar_repository_impl.dart';
import 'package:goldcity/data/repository/lead/lead_repository_impl.dart';
import 'package:goldcity/data/repository/notification/notification_repository_impl.dart';
import 'package:goldcity/data/repository/project/project_repository_impl.dart';
import 'package:goldcity/data/repository/project_detail/project_detail_repository_impl.dart';
import 'package:goldcity/data/source/local/announcement/announcement_local_data_source.dart';
import 'package:goldcity/data/source/local/project/project_local_data_source.dart';
import 'package:goldcity/data/source/remote/announcement/announcement_remote_data_source.dart';
import 'package:goldcity/data/source/remote/complex/complex_remote_data_source.dart';
import 'package:goldcity/data/source/remote/complex_detail/complex_detail_remote_data_source.dart';
import 'package:goldcity/data/source/remote/contact/contact_remote_data_source.dart';
import 'package:goldcity/data/source/remote/education/education_remote_data_source.dart';
import 'package:goldcity/data/source/remote/shareable_page/shareable_page_remote_data_source.dart';
import 'package:goldcity/data/source/remote/webinar/webinar_remote_data_source.dart';
import 'package:goldcity/data/source/remote/lead/lead_remote_data_source.dart';
import 'package:goldcity/data/source/remote/notification/notification_remote_data_source.dart';
import 'package:goldcity/data/source/remote/project/project_remote_data_source.dart';
import 'package:goldcity/data/source/remote/project_detail/project_detail_remote_data_source.dart';
import 'package:goldcity/domain/repository/announcement/announcement_repository.dart';
import 'package:goldcity/domain/repository/complex/complex_repository.dart';
import 'package:goldcity/domain/repository/complex_detail/complex_detail_repository.dart';
import 'package:goldcity/domain/repository/contact/contact_repository.dart';
import 'package:goldcity/domain/repository/education/education_repository.dart';
import 'package:goldcity/domain/repository/shareable_page/shareable_page_repository.dart';
import 'package:goldcity/domain/repository/webinar/webinar_repository.dart';
import 'package:goldcity/domain/repository/lead/lead_repository.dart';
import 'package:goldcity/domain/repository/notification/notification_repository.dart';
import 'package:goldcity/domain/repository/project/project_repository.dart';
import 'package:goldcity/domain/repository/project_detail/project_detail_repository.dart';
import 'package:goldcity/domain/usecase/announcement_usecase.dart';
import 'package:goldcity/domain/usecase/complex_detail_usecase.dart';
import 'package:goldcity/domain/usecase/complex_usecase.dart';
import 'package:goldcity/domain/usecase/contact_usecase.dart';
import 'package:goldcity/domain/usecase/education_usecase.dart';
import 'package:goldcity/domain/usecase/shareable_page_usecase.dart';
import 'package:goldcity/domain/usecase/webinar_usecase.dart';
import 'package:goldcity/domain/usecase/lead_usecase.dart';
import 'package:goldcity/domain/usecase/notification_usecase.dart';
import 'package:goldcity/domain/usecase/project_detail_usecase.dart';
import 'package:goldcity/domain/usecase/project_usecase.dart';
import 'package:goldcity/util/resources/authentication_source.dart';

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton(() => RemoteManager());
  locator.registerSingleton(FcmManager());
  locator.registerLazySingleton(() => LeadUseCase());
  locator.registerLazySingleton(() => ContactUseCase());
  locator.registerLazySingleton(() => AuthenticationSource());
  locator.registerLazySingleton(() => ComplexUseCase());
  locator.registerLazySingleton(() => NotificationUseCase());
  locator.registerLazySingleton(() => WebinarUseCase());
  locator.registerLazySingleton(() => ShareablePageUseCase());
  locator.registerLazySingleton(() => ComplexDetailUseCase());
  locator.registerLazySingleton(() => ProjectUseCase());
  locator.registerLazySingleton(() => ProjectDetailUseCase());
  locator.registerLazySingleton(() => LocalManager());
  locator.registerLazySingleton(() => SharedManager());
  locator.registerLazySingleton(() => EducationUseCase());
  locator.registerLazySingleton(() => AnnouncementUseCase());

  locator.registerLazySingleton<LeadRepository>(() => LeadRepositoryImpl());
  locator.registerLazySingleton<LeadRemoteDataSource>(
      () => LeadRemoteDataSourceImpl());

  locator
      .registerLazySingleton<ContactRepository>(() => ContactRepositoryImpl());
  locator.registerLazySingleton<ContactRemoteDataSource>(
      () => ContactRemoteDataSourceImpl());

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

  locator
      .registerLazySingleton<ComplexRepository>(() => ComplexRepositoryImpl());

  locator.registerLazySingleton<ComplexRemoteDataSource>(
      () => ComplexRemoteDataSourceImpl());

  locator.registerLazySingleton<ComplexDetailRepository>(
      () => ComplexDetailRepositoryImpl());

  locator.registerLazySingleton<ComplexDetailRemoteDataSource>(
      () => ComplexDetailRemoteDataSourceImpl());

  locator
      .registerLazySingleton<WebinarRepository>(() => WebinarRepositoryImpl());
  locator.registerLazySingleton<WebinarRemoteDataSource>(
      () => WebinarRemoteDataSourceImpl());

  locator.registerLazySingleton<NotificationRepository>(
      () => NotificationRepositoryImpl());
  locator.registerLazySingleton<NotificationRemoteDataSource>(
      () => NotificationRemoteDataSourceImpl());

  locator.registerLazySingleton<EducationRepository>(
      () => EducationRepositoryImpl());
  locator.registerLazySingleton<EducationRemoteDataSource>(
      () => EducationRemoteDataSourceImpl());

  locator.registerLazySingleton<ShareablePageRepository>(
      () => ShareablePageRepositoryImpl());
  locator.registerLazySingleton<ShareablePageRemoteDataSource>(
      () => ShareablePageRemoteDataSourceImpl());

  locator.registerLazySingleton<AnnouncementRepository>(
      () => AnnouncementRepositoryImpl());
  locator.registerLazySingleton<AnnouncementRemoteDataSource>(
      () => AnnouncementRemoteDataSourceImpl());
  locator.registerLazySingleton<AnnouncementLocalDataSource>(
      () => AnnouncementLocalDataSourceImpl());
}
