/// Interface for model mappers. It provides helper methods that facilitate
/// retrieving of models from outer data source layers
abstract class Mapper<E, D> {
  D mapFromEntity(E type);

  E mapToEntity(D type);
}