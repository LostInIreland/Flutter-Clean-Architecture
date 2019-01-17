abstract class Mapper<C, E> {
  E mapFromCache(C type);

  C mapToCache(E type);
}