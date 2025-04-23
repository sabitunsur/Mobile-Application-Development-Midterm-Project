/// @project   :  Dropdown menü ile şehir seçimi ve gösterimi
/// @university: Erciyes Üniversitesi
/// @faculty   : Mühendislik Fakültesi
/// @department: Bilgisayar Mühendisliği
/// @course    : Mobile Application Development
/// @advisor   : Dr. Öğr. Üyesi. [Fehim KÖYLÜ]
/// @purpose   : Bu proje, Mobile Application Development dersi kapsamında vize proje ödevi olarak Flutter ile geliştirilmiştir.
///              Uygulama, Firebase Firestore'dan şehir verilerini çekmekte ve kullanıcıya dropdown menü ile seçim imkânı sunmaktadır.

/// @author    : [Sabit Ünsür]
/// @student_id: [1030521065]
/// @date      : [23.04.2025]

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addCities() async {
  final cities = [
    "Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya",
    "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu",
    "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır",
    "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun",
    "Gümüşhane", "Hakkâri", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir",
    "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya",
    "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş",
    "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop",
    "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak",
    "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale",
    "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük",
    "Kilis", "Osmaniye", "Düzce"
  ];

  final firestore = FirebaseFirestore.instance;
  final collection = firestore.collection('sehirler');

  for (var city in cities) {
    await collection.add({'ad': city});
  }

  print('81 şehir başarıyla eklendi!');
}
