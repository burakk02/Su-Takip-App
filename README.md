# 💧 Su Takip - Cep Asistanı (Water Tracker App)

Bu proje, kullanıcıların günlük su içme hedeflerini belirlemelerine ve gün içindeki tüketimlerini şık bir arayüzle takip etmelerine olanak tanıyan modern bir Flutter mobil uygulamasıdır.

"Clean Code" prensipleri ve ölçeklenebilir bir mimari göz önünde bulundurularak geliştirilmiştir.

---

## 🚀 Öne Çıkan Özellikler

- 💧 **Dinamik Hedef Belirleme:** Kullanıcılar günlük su içme hedeflerini (Örn: 2.5L, 3.0L) belirleyebilir.  
- ⚡ **Anlık Takip:** Eklenen her miktar (200ml, 500ml), akıcı animasyonlarla anında güncellenir.  
- 🔄 **Akıllı Geri Al (Undo):** Yanlış eklenen sular LIFO (Stack) mantığıyla geri alınabilir.  
- 📱 **Responsive Tasarım:** Farklı ekran boyutlarında sorunsuz görünüm.  

---

## 🛠️ Kullanılan Teknolojiler ve Mimari

- **Framework:** Flutter / Dart  
- **State Management:** Riverpod (`NotifierProvider`, `ConsumerWidget`)  
- **Mimari:** Feature-First yapı  
- **State Yapısı:** Immutable model + `copyWith`  

---

## 📂 Klasör Yapısı (Özet)

```text
lib/
 ┣ core/               # Renkler, sabitler
 ┃ ┗ constants/
 ┣ features/
 ┃ ┗ water_tracking/
 ┃   ┣ models/
 ┃   ┣ providers/
 ┃   ┗ views/
 ┗ main.dart


📸 Ekran Görüntüleri
<p align="center"> <img src="screenshots/1.png" width="30%" /> <img src="screenshots/2.png" width="30%" /> <img src="screenshots/3.png" width="30%" /> </p>
