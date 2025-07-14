import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'presentation/pages/breeds_list_page.dart';
import 'presentation/pages/random_fact_page.dart';
import 'presentation/pages/breed_detail_page.dart';
import 'presentation/pages/home_page.dart';
import 'domain/entities/breed.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true, path: '/', children: [
          AutoRoute(page: BreedsListRoute.page, path: 'breeds', initial: true),
          AutoRoute(page: RandomFactRoute.page, path: 'fact'),
        ]),
        AutoRoute(page: BreedDetailRoute.page, path: '/breed'),
      ];
}
