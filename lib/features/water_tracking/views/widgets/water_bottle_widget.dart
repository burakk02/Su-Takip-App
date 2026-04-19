import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpod radyosunu getirdik
import 'package:su_takip/core/constants/app_colors/app_colors.dart';

import '../../providers/water_tracking_provider.dart'; // Radyo Kulemizin adresini getirdik

// StatelessWidget yerine ConsumerWidget kullanıyoruz!
class WaterBottleWidget extends ConsumerWidget {
  const WaterBottleWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. DİNLEME İŞLEMİ (WATCH):
    // "waterTrackingProvider" kulesini dinle, oradaki veriyi "waterData" paketine koy.
    // Eğer kuledeki su değişirse, ref.watch burayı otomatik olarak baştan çalıştıracak!
    final waterData = ref.watch(waterTrackingProvider);

    // 2. MATEMATİK HESABI:
    // İçilen suyu, hedeflenen suya bölüyoruz. (Örn: 0 / 2500 = 0.0)
    // Değerin sıfırın altına düşmesini veya 1'i geçmesini engellemek için clamp kullanıyoruz.
    double fillPercentage = (waterData.currentInMl / waterData.targetInMl).clamp(0.0, 1.0);

    return Column(
      children: [
        // 1. Kapak
        Container(
          width: 80,
          height: 25,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
        ),

        // 2. Ana Gövde
        Container(
          width: 150,
          height: 300,
          decoration: BoxDecoration(
              color: AppColors.cardWhite,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey.shade300, width: 2),
              boxShadow: [
                BoxShadow(
                  color: AppColors.waterBlue.withOpacity(0.2),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // 3. Animasyonlu Su
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  width: double.infinity,
                  // Suyun yüksekliği artık kulenin verisine göre değişiyor!
                  height: 300 * fillPercentage,
                  decoration: const BoxDecoration(
                    color: AppColors.waterBlue,
                  ),
                ),

                // 4. Yazılar
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.water_drop_outlined, color: Colors.grey.shade600, size: 32),
                      const SizedBox(height: 8),
                      Text(
                        "Su Takibi",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 20),
                      // Ekrana hesapladığımız yüzdeyi yazdırıyoruz
                      Text(
                        "%${(fillPercentage * 100).toInt()}",
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}