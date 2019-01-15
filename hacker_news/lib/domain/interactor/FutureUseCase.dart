///
/// Abstract class for a UseCase that returns an instance of a [Future].
abstract class FutureUseCase<In, Out> {
  Future<Out> execute(In params);
}