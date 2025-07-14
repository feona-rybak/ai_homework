import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        BreedsListRoute(),
        RandomFactRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Breeds'),
            BottomNavigationBarItem(icon: Icon(Icons.question_answer), label: 'Fact'),
          ],
        );
      },
    );
  }
}
