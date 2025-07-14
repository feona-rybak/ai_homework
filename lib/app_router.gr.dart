// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BreedDetailRoute.name: (routeData) {
      final args = routeData.argsAs<BreedDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BreedDetailPage(
          key: args.key,
          breed: args.breed,
        ),
      );
    },
    BreedsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BreedsListPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    RandomFactRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RandomFactPage(),
      );
    },
  };
}

/// generated route for
/// [BreedDetailPage]
class BreedDetailRoute extends PageRouteInfo<BreedDetailRouteArgs> {
  BreedDetailRoute({
    Key? key,
    required Breed breed,
    List<PageRouteInfo>? children,
  }) : super(
          BreedDetailRoute.name,
          args: BreedDetailRouteArgs(
            key: key,
            breed: breed,
          ),
          initialChildren: children,
        );

  static const String name = 'BreedDetailRoute';

  static const PageInfo<BreedDetailRouteArgs> page =
      PageInfo<BreedDetailRouteArgs>(name);
}

class BreedDetailRouteArgs {
  const BreedDetailRouteArgs({
    this.key,
    required this.breed,
  });

  final Key? key;

  final Breed breed;

  @override
  String toString() {
    return 'BreedDetailRouteArgs{key: $key, breed: $breed}';
  }
}

/// generated route for
/// [BreedsListPage]
class BreedsListRoute extends PageRouteInfo<void> {
  const BreedsListRoute({List<PageRouteInfo>? children})
      : super(
          BreedsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'BreedsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RandomFactPage]
class RandomFactRoute extends PageRouteInfo<void> {
  const RandomFactRoute({List<PageRouteInfo>? children})
      : super(
          RandomFactRoute.name,
          initialChildren: children,
        );

  static const String name = 'RandomFactRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
