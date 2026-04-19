import 'package:flutter_riverpod/flutter_riverpod.dart';
// Kendi oluşturduğumuz veri kalıbını import ediyoruz
import '../models/water_goal_model.dart';

// 1. Kule Yöneticisi (Notifier)
// Bu sınıf, içeride dönen matematiği ve mantığı yönetir.
// "Notifier<WaterGoalModel>" demek: "Bu yönetici, sadece WaterGoalModel verisinden sorumludur" demektir.
class WaterTrackingNotifier extends Notifier<WaterGoalModel> {
  // '_' ile başladığı için private; bu listeye sadece bu sınıf içinden erişilebilir.
  // Bu bizim 'Yığın' (Stack) yapımız olacak.
  final List<int> _history = [];

  @override
  WaterGoalModel build() {
    return WaterGoalModel(targetInMl: 2500, currentInMl: 0);
  }

  // 2. Su Ekleme Fonksiyonu
  void addWater(int amountInMl) {
    // Yapılan işlemi geçmişe ekle
    _history.add(amountInMl);

    // Toplamı güncelle (Eskisi gibi)
    final newAmount = state.currentInMl + amountInMl;
    state = state.copyWith(currentInMl: newAmount);
  }
  // Geri al fonksiyonu (Şimdilik iskelet olarak bırakıyoruz, mantığını sonra kuracağız)
  void undoLastAction() {
    // 1. Liste boş mu kontrol et (Güvenlik önlemi)
    if (_history.isEmpty) return;

    // 2. Listenin sonundaki elemanı (en son eklenen su) al ve listeden sil (pop)
    final lastAdded = _history.removeLast();

    // 3. Yeni miktarı hesapla (Toplam - Son eklenen)
    final newAmount = state.currentInMl - lastAdded;

    // 4. Vitrini (state) güncelle
    state = state.copyWith(currentInMl: newAmount);
  }

  void setTarget(int newTargetInMl) {
    state = state.copyWith(targetInMl: newTargetInMl);
  }
}

// 3. Radyo Kulesinin Kendisi (Provider)
// Uygulamanın diğer sayfaları veya butonları, bu kuleye erişmek için 'waterTrackingProvider' ismini kullanacak.
final waterTrackingProvider = NotifierProvider<WaterTrackingNotifier, WaterGoalModel>(() {
  return WaterTrackingNotifier();
});