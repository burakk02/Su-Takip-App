# 💧 Su Takip - Cep Asistanı (Water Tracker App)

Bu proje, kullanıcıların günlük su içme hedeflerini belirlemelerine ve gün içindeki tüketimlerini şık bir arayüzle takip etmelerine olanak tanıyan, modern bir Flutter mobil uygulamasıdır. 

"Clean Code" prensipleri ve ölçeklenebilir bir mimari göz önünde bulundurularak geliştirilmiştir.

## 🚀 Öne Çıkan Özellikler
* **Dinamik Hedef Belirleme:** Kullanıcılar kendi günlük su içme hedeflerini (Örn: 2.5L, 3.0L) belirleyebilir.
* **Anlık Takip:** Eklenen her miktar (200ml, 500ml), akıcı animasyonlarla hem görsel termosta hem de yüzde (%) olarak anında güncellenir.
* **Akıllı Geri Al (Undo) Sistemi:** Yanlışlıkla eklenen sular, LIFO (Stack) mantığıyla adım adım geri alınabilir.
* **Duyarlı (Responsive) Tasarım:** FittedBox ve esnek widget'lar sayesinde farklı ekran boyutlarında kusursuz görünüm.

## 🛠️ Kullanılan Teknolojiler ve Mimari
Bu proje, modern Flutter geliştirme standartlarına uygun olarak tasarlanmıştır:
* **Framework:** Flutter / Dart
* **State Management (Durum Yönetimi):** [Riverpod](https://riverpod.dev/) (`ConsumerWidget`, `NotifierProvider`)
* **Mimari Yapı:** Feature-First (Özellik Odaklı) klasörleme yapısı. İş mantığı (`providers`) ile arayüz (`views/widgets`) birbirinden tamamen izole edilmiştir.
* **Veri Yönetimi:** `copyWith` metodu ile Immutable (Değişmez) veri modelleri kullanılarak güvenli state güncellemeleri sağlanmıştır.

## 📂 Klasör Yapısı (Özet)
```text
lib/
 ┣ core/               # Uygulamanın temel taşları (Renk paletleri, sabitler)
 ┃ ┗ constants/
 ┣ features/           # Özellik odaklı modüller
 ┃ ┗ water_tracking/
 ┃   ┣ models/         # Veri kalıpları (WaterGoalModel)
 ┃   ┣ providers/      # Riverpod iş mantığı (WaterTrackingNotifier)
 ┃   ┗ views/          # Kullanıcı arayüzü ve parçalanmış Widget'lar
 ┗ main.dart           # Uygulama başlangıç noktası


## 📸 Ekran Görüntüleri
<img width="412" height="867" alt="Uygulama_kullanımı" src="https://github.com/user-attachments/assets/d20e3b24-f360-4f39-81b0-25752946314d" />
<img width="412" height="875" alt="Hedef_seçimi" src="https://github.com/user-attachments/assets/18807bd4-5cab-4e20-b2ba-505cd41f9a75" />
<img width="410" height="873" alt="Uygulama_başlangıcı" src="https://github.com/user-attachments/assets/1625ee88-9237-4a19-8b13-8f3ad6e9b5b5" />






