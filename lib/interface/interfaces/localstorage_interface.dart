abstract class ILocalStorage {
  //Create
  Future put(String key, dynamic value);

  // Read
  Future get(String key);

  // Delete
  Future delete(String key);
}
