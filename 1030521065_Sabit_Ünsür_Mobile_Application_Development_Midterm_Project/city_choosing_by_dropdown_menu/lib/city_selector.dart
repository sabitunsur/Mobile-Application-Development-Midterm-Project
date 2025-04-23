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
import 'package:flutter/material.dart';

class CitySelectorPage extends StatefulWidget {
  @override
  _CitySelectorPageState createState() => _CitySelectorPageState();
}

class _CitySelectorPageState extends State<CitySelectorPage> {
  List<String> cities = [];
  String? selectedCity;

  @override
  void initState() {
    super.initState();
    fetchCities();
  }

  Future<void> fetchCities() async {
    final snapshot = await FirebaseFirestore.instance.collection('sehirler').get();
    final List<String> cityList = snapshot.docs.map((doc) => doc['ad'] as String).toList();

    setState(() {
      cities = cityList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      appBar: AppBar(
        title: Text('Şehir Seç'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              isExpanded: true,
              value: selectedCity,
              decoration: InputDecoration(
                labelText: "Bir şehir seçin",
                labelStyle: TextStyle(color: Colors.deepPurple),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
              ),
              items: cities.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                });
              },
            ),
            SizedBox(height: 32),
            if (selectedCity != null)
              Text(
                "Seçilen şehir: $selectedCity",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
          ],
        ),
      ),
    );
  }
}
