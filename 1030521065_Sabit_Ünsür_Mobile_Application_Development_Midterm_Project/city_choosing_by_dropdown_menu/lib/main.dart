/// @project   :  Dropdown menü ile şehir seçimi ve gösterimi
/// @university: Erciyes Üniversitesi
/// @faculty   : Mühendislik Fakültesi
/// @department: Bilgisayar Mühendisliği
/// @course    : Mobile Application Development
/// @advisor   : Dr. Öğr. Üyesi. [Fehim KÖYLÜ]
/// @purpose   : Bu proje, Mobile Application Development kapsamında vize proje ödevi olarak Flutter ile geliştirilmiştir.
///              Uygulama, Firebase Firestore'dan şehir verilerini çekmekte ve kullanıcıya dropdown menü ile seçim imkânı sunmaktadır.

/// @author    : [Sabit Ünsür]
/// @student_id: [1030521065]
/// @date      : [23.04.2025]

//import 'package:city_choosing/add_cities.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'city_selector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await addCities(); -> seed data
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CitySelectorPage(),
    );
  }
}
