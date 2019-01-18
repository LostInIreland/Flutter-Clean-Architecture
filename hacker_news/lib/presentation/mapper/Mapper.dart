/// Interface for model mappers. It provides helper methods
/// that facilitate retrieving of models from outer layers
abstract class Mapper<D, V> {
  V mapToView(D type);
}