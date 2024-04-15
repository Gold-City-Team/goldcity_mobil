final class CacheEntity {
  DateTime? cachedTime;
  List cachedData = [];

  CacheEntity({required this.cachedTime, required this.cachedData});

  CacheEntity.fromJson(Map<String, dynamic> json) {
    cachedTime = DateTime.parse(json["cachedTime"].toString());
    cachedData = json["cachedData"];
  }

  Map<String, dynamic> toJson() {
    return {
      "cachedTime": "$cachedTime",
      "cachedData": cachedData.map((e) => e.toJson()).toList()
    };
  }
}
