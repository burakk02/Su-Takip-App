import 'package:flutter/material.dart';

class AppColors {
  // Sınıfın kurucu metodunu (constructor) gizliyoruz.
  // Neden? Çünkü kimsenin yanlışlıkla "AppColors renklerim = AppColors();" demesini istemiyoruz.
  // Biz sadece içindeki sabit renklere doğrudan "AppColors.waterBlue" diyerek erişeceğiz.
  AppColors._();

  // Renklerimizi 'static const' olarak tanımlıyoruz.
  static const Color backgroundBlue = Color(0xFFE8F5E9); // Arka plandaki ferah su yeşili/mavisi
  static const Color waterBlue = Color(0xFF29B6F6);      // Termosun içindeki suyun rengi
  static const Color textDark = Color(0xFF37474F);       // Başlıklar için koyu renk
  static const Color cardWhite = Colors.white;           // Butonların ve termosun arka planı
}