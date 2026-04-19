class WaterGoalModel {
  // Litre yerine mililitre (ml) kullanacağız çünkü matematikte tam sayılarla (int) çalışmak,
  // ondalıklı sayılarla (double) çalışmaktan her zaman daha güvenli ve hatasızdır.
  final int targetInMl;  // Örn: 2500 (2.5L)
  final int currentInMl; // Örn: 1200 (1.2L)

  // Constructor (Yapıcı Metot): Bu kalıptan bir veri üretirken bizden istenenler.
  WaterGoalModel({
    required this.targetInMl,
    required this.currentInMl,
  });

  // copyWith metodu: Riverpod'un en sevdiği özellik.
  WaterGoalModel copyWith({
    int? targetInMl,
    int? currentInMl,
  }) {
    return WaterGoalModel(
      targetInMl: targetInMl ?? this.targetInMl,
      currentInMl: currentInMl ?? this.currentInMl,
    );
  }
}