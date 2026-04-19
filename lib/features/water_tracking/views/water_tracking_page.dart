import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:su_takip/features/water_tracking/views/widgets/add_water_buttons.dart';
import 'package:su_takip/features/water_tracking/views/widgets/progress_text_widget.dart';
import 'package:su_takip/features/water_tracking/views/widgets/water_bottle_widget.dart';
import 'package:su_takip/features/water_tracking/providers/water_tracking_provider.dart';

import '../../../core/constants/app_colors/app_colors.dart';
// Kendi oluşturduğumuz renk dosyasını içeri aktarıyoruz.
// (Dosya yolu senin projende farklıysa, Android Studio'nun otomatik düzeltmesini kullanabilirsin)


class WaterTrackingPage extends ConsumerWidget {
  const WaterTrackingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Scaffold: Uygulamamızın ana beyaz kağıdı / iskeletidir.
    return Scaffold(
      backgroundColor: AppColors.backgroundBlue, // Arka plan rengimizi verdik

      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Su Takip",style: TextStyle(color: Colors.yellowAccent,fontSize: 24),),
            Text("Cep Asistanı",style: TextStyle(color: Colors.yellow,fontSize: 17),),

          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan, // Arkaplanla bütünleşsin diye şeffaf yaptık
        elevation: 0, // Altındaki gölgeyi sıfırladık ki düz dursun
        actions: [
          // actions listesi, sağ üst köşeye ikonlar koymamızı sağlar
          PopupMenuButton(
            child: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text("Hedef Değiştir"),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("uygulamadan çık"),
              ),
              
            ],
            onSelected: (menuItemValue){
              if(menuItemValue == 1){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Hedef litre"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                ref.read(waterTrackingProvider.notifier).setTarget(2000);
                                Navigator.pop(context); // İşin bitince pop-up'ı kapat
                              },
                              child:Text("2 litre")
                          ),

                          ElevatedButton(
                              onPressed: () {
                                ref.read(waterTrackingProvider.notifier).setTarget(2500);
                                Navigator.pop(context); // İşin bitince pop-up'ı kapat
                              },
                              child:Text("2.5 litre")
                          ),

                          ElevatedButton(
                              onPressed: () {
                                ref.read(waterTrackingProvider.notifier).setTarget(3000);
                                Navigator.pop(context); // İşin bitince pop-up'ı kapat
                              },
                              child:Text("3 litre")
                          ),


                        ],

                      ),
                        actions: [
                          TextButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text("iptal")
                          )
                        ]
                      
                    );

                  }
                );
              }
              if(menuItemValue == 2){
                print("Uygulamadan Çıkılıyor");
              }
            },

          ),
        ],
      ),

      // SafeArea: Telefonların üstündeki kamera çentiği (notch) veya alt kaydırma çubuğunun
      // tasarımımızın üstüne binmesini engeller. Her şeyi güvenli alanda tutar.
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Ekranın kenarlarından 20 birim boşluk bıraktık

          // Column: Widget'ları yukarıdan aşağıya (alt alta) dizmemizi sağlar.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Her şeyi yatayda ortala
            children: [
              // 1. BÖLÜM: Üst Başlıklar (Şimdilik yer tutucu koyuyoruz)
              const ProgressTextWidget(),

              const SizedBox(height: 40), // Araya 40 birim boşluk koyduk

              // 2. BÖLÜM: Termos Görseli
              // Expanded: Kalan tüm boş alanı kapla demektir. Termosun ekranın ortasına
              // yayılmasını ve küçük/büyük her telefonda ortada durmasını sağlar.
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20), // Termos diğer elementlere yapışmasın diye pay bıraktık
                  child: FittedBox(
                    fit: BoxFit.contain, // Oranını bozmadan boşluğa sığacak kadar küçült (veya büyüt)
                    child: const WaterBottleWidget(),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // 3. BÖLÜM: Alt Butonlar
              const AddWaterButtonsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}