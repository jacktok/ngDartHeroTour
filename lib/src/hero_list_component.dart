import 'package:angular/angular.dart';

import 'hero.dart';
import 'hero_component.dart';
import 'hero_service.dart';

@Component(
    selector: 'hero-list',
    styleUrls: ['hero_list_component.css'],
    templateUrl: 'hero_list_component.html',
    directives: [coreDirectives, HeroComponent],
)
class HeroListComponent implements OnInit {
  final HeroService _heroService;

  Hero selected;
  List<Hero> heroes;

  HeroListComponent(this._heroService);

  void _getHeroes() {
    _heroService.getAllSlowly().then((heroList) => this.heroes = heroList);
  }

  void onSelect(Hero hero) => selected = hero;

  @override
  void ngOnInit() {
    _getHeroes();
  }
}
