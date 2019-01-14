import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:m_track/app_component.template.dart' as ng;
import 'package:http/http.dart';
import 'main.template.dart' as self;
import 'package:m_track/in_memory_data_service.dart';

@GenerateInjector([
  routerProvidersHash,
//  ClassProvider(BrowserClient),
ClassProvider(Client, useClass: InMemoryDataService),
])

final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
