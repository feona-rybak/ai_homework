import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../../data/datasources/breed_remote_data_source.dart';
import '../../data/datasources/fact_remote_data_source.dart';
import '../../data/repositories/breed_repository_impl.dart';
import '../../data/repositories/fact_repository_impl.dart';
import '../../domain/repositories/breed_repository.dart';
import '../../domain/repositories/fact_repository.dart';
import '../../domain/usecases/get_breeds.dart';
import '../../domain/usecases/get_random_fact.dart';
import '../../presentation/bloc/breeds/breeds_bloc.dart';
import '../../presentation/bloc/fact/fact_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: 'https://api.thecatapi.com/v1/')));

  // DataSources
  sl.registerLazySingleton<BreedRemoteDataSource>(() => BreedRemoteDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<FactRemoteDataSource>(() => FactRemoteDataSourceImpl(sl()));

  // Repositories
  sl.registerLazySingleton<BreedRepository>(() => BreedRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<FactRepository>(() => FactRepositoryImpl(remoteDataSource: sl()));

  // UseCases
  sl.registerLazySingleton<GetBreeds>(() => GetBreeds(sl()));
  sl.registerLazySingleton<GetRandomFact>(() => GetRandomFact(sl()));

  // Blocs / Cubits (if you want to resolve manually instead of BlocProvider)
  sl.registerFactory(() => BreedsBloc(sl()));
  sl.registerFactory(() => FactCubit(sl()));
}
