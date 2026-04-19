import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:su_takip/core/constants/app_colors/app_colors.dart';

import '../../providers/water_tracking_provider.dart';

class ProgressTextWidget extends ConsumerWidget {
  const ProgressTextWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Kuleyi Dinle
    final waterData = ref.watch(waterTrackingProvider);

    // 2. Matematik (Litreye Çevir)
    final currentLitre = (waterData.currentInMl / 1000).toStringAsFixed(1);
    final targetLitre = (waterData.targetInMl / 1000).toStringAsFixed(1);

    // 3. AKILLI ROZET MANTIĞI
    // Eğer su sıfırsa 'başla' mesajı ve mavi tema ver, değilse 'harika' mesajı ve yeşil tema ver.
    final bool isStarted = waterData.currentInMl > 0;

    final String badgeText = isStarted ? "Harika gidiyorsun!" : "Hadi, ilk suyunu iç!";
    final IconData badgeIcon = isStarted ? Icons.check_circle : Icons.water_drop;
    final Color badgeBgColor = isStarted ? Colors.teal.shade50 : Colors.blue.shade50;
    final Color badgeTextColor = isStarted ? Colors.teal.shade700 : Colors.blue.shade700;

    return Column(
      children: [
        const Text(
          "Su Takibi: Merhaba, Güne Su İçerek Başla!",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),

        // 4. Ekrana Çizilen Akıllı Rozet

            AnimatedContainer( // AnimatedContainer ile renk değişimini yumuşattık
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: badgeBgColor, // Dinamik Renk
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(badgeIcon, color: badgeTextColor, size: 18), // Dinamik İkon
                  const SizedBox(width: 8),
                  Text(
                    badgeText, // Dinamik Yazı
                    style: TextStyle(
                      color: badgeTextColor, // Dinamik Renk
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),






        const SizedBox(height: 12),

        // Ana İlerleme Metni (RichText)
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${currentLitre}L ",
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: "/ ${targetLitre}L",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}