/// Interface for model mappers. It provides helper methods
/// that facilitate retrieving of models from outer layers
abstract class Mapper<V, VM> {
  VM mapToViewModel(V type);
}