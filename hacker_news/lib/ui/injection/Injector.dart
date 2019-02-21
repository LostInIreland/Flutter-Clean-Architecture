import 'package:hacker_news/ui/injection/Module.dart';
import 'package:kiwi/kiwi.dart';

final injector = Injector._internal();

class Injector {
  final Container container = Container();

  Injector._internal();

  void inject(List<Module> modules) {
    modules.forEach((module) => module.registerOn(container));
  }

  T resolve<T>([String name]) => container.resolve(name);
}