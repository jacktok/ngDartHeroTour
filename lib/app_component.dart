import 'package:angular/angular.dart';
import 'src/hero_service.dart';
import 'package:angular_router/angular_router.dart';
// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [coreDirectives],
  providers: [ClassProvider(HeroService)]
)
class AppComponent  {
  var title = 'Tour heroes';


}
