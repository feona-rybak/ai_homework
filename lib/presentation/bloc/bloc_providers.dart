import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/service_locator.dart';
import 'breeds/breeds_bloc.dart';
import 'fact/fact_cubit.dart';

class AppBlocProviders {
  static List<BlocProvider> providers = [
    BlocProvider(create: (_) => BreedsBloc(sl())..add(const BreedsFetched())),
    BlocProvider(create: (_) => FactCubit(sl())..fetch()),
  ];
}
