import 'package:auto_route/annotations.dart';

import '../cardhs_detail_page.dart';
import '../favorite_page.dart';
import '../home_page.dart';

@AdaptiveAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute>[
      AutoRoute(page: HomePage, initial: true),
      AutoRoute(page: CardHSDetailPage),
      AutoRoute(page: FavoritePage),
    ]
)
class $AppRouter {}