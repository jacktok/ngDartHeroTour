import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'hero.dart';
import 'hero_service.dart';
import 'route_paths.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'my-hero',
  templateUrl: 'hero_component.html',
  styleUrls: ['hero_component.css'],
  directives: [coreDirectives, formDirectives],
)
class HeroComponent implements OnActivate {
  Hero hero;

  final HeroService _heroService;
  final Location _location;

  HeroComponent(this._heroService, this._location);

  @override
  void onActivate(RouterState previous, RouterState current) {
    final id = getId(current.parameters);
    if (id != null) _heroService.get(id).then((hero) => this.hero = hero);
  }

  int getId(Map<String, String> parameters) {
    final id = parameters[idParam];
    return id == null ? null : int.tryParse(id);
  }

  void goBack() => _location.back();

  Future<void> save() async {
    await _heroService.update(hero);
  }
}
