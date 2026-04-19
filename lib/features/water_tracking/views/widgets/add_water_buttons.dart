import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:su_takip/core/constants/app_colors/app_colors.dart';
import 'package:su_takip/features/water_tracking/providers/water_tracking_provider.dart';


class AddWaterButtonsWidget extends ConsumerWidget {
  const AddWaterButtonsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _WaterButton(
              amount: "200ml",
              icon: Icons.local_drink_outlined,
              label: "Küçük Bardak",
              onTap: () {
                // ref.read -> Kuleyle iletişime geç
                // .notifier -> Kuledeki "Yönetici" ile konuşmak istiyorum (çünkü matematik ondaydı)
                // .addWater(200) -> Yöneticiye "suyu 200ml artır" emrini ver!
                ref.read(waterTrackingProvider.notifier).addWater(200);
              },
            ),
            _WaterButton(
              amount: "500ml",
              icon: Icons.water_drop_outlined,
              label: "Yarım Litre",
              onTap: () {
                // 3. EMİR VER: 500ml ekle
                ref.read(waterTrackingProvider.notifier).addWater(500);
              },
            ),
          ],
        ),

        const SizedBox(height: 30),

        TextButton.icon(
          onPressed: () {
            // Kuledeki yöneticiye "son işlemi geri al" emrini ver
            ref.read(waterTrackingProvider.notifier).undoLastAction();
          },
          icon: const Icon(Icons.undo, color: Colors.blueGrey, size: 20),
          label: const Text(
            "Geri Al",
            style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}

// DRY Prensibi: Tekrar kullanılabilir buton kalıbımız
class _WaterButton extends StatelessWidget {
  final String amount;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _WaterButton({
    required this.amount,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.waterBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              amount,
              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: AppColors.waterBlue.withOpacity(0.3), width: 2),
                boxShadow: [
                  BoxShadow(color: AppColors.waterBlue.withOpacity(0.1), blurRadius: 10),
                ]
            ),
            child: Icon(icon, size: 30, color: AppColors.waterBlue),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textDark),
          ),
        ],
      ),
    );
  }
}