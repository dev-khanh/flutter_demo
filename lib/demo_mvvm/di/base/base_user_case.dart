abstract class BaseUserCase<T>{
  Future<T> perform();
}