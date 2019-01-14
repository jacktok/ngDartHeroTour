import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'hero.dart';
import 'hero_component.dart';
import 'hero_service.dart';
import 'route_paths.dart';
import 'routes.dart';

@Component(
  selector: 'hero-list',
  styleUrls: ['hero_list_component.css'],
  templateUrl: 'hero_list_component.html',
  directives: [coreDirectives, HeroComponent],
  pipes: [commonPipes],
)
class HeroListComponent implements OnInit {
  final HeroService _heroService;
  final Router _router;

  Hero selected;
  List<Hero> heroes;

  HeroListComponent(this._heroService, this._router);

  void _getHeroes() {
    _heroService.getAll().then((heroList) => this.heroes = heroList);
  }

  void onSelect(Hero hero) => selected = hero;

  @override
  void ngOnInit() {
    _getHeroes();
  }

  String _heroUrl(int id) =>
      RoutePaths.hero.toUrl(parameters: {idParam: '${id}'});

  Future<void> add(String name) async {
    name = name.trim();
    if (name.isEmpty) return null;
    heroes.add(await _heroService.create(name));
    selected = null;
  }
  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_heroUrl(selected.id));
}
