import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/water_tracking/views/water_tracking_page.dart';

void main() {
  // Riverpod kullanacağımız için uygulamamızı ProviderScope içine alarak başlatıyoruz.
  // Bu bizim radyo kulemizin antenidir.
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Sağ üstteki "Debug" yazısını kaldırır
      title: 'Su Takip',
      home: WaterTrackingPage(), // Az önce yaptığımız sayfayı açılış sayfası yaptık
    );
  }
}