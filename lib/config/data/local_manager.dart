import 'dart:convert';

import 'package:goldcity/domain/entity/cache/cache_entity.dart';
import 'package:hive/hive.dart';

class LocalManager {
  Box<String>? _box;

  init() async {
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox<String>("cache");
    }
  }

  Future<void> cacheData(String key, List value) async {
    var cacheModel = CacheEntity(cachedTime: DateTime.now(), cachedData: value);
    await _box?.put(key, json.encode(cacheModel.toJson()));
  }

  Map<String, dynamic>? getData({required String key}) {
    if (_box != null && _box!.get(key) != null) {
      var dbResult = json.decode(_box!.get(key)!);
      return dbResult;
    }
    return null;
  }

  Future<int> clearCache() async {
    if (_box != null) {
      return _box!.clear();
    }
    return -1;
  }
}
