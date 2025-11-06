import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clone Home UI',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> menuItems = [
    {"title": "Makanan"},
    {"title": "Motor"},
    {"title": "Mobil"},
    {"title": "Express"},
    {"title": "Belanja"},
    {"title": "Pulsa & bills"},
    {"title": "Dine Out"},
    {"title": "Semua"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Header gradient (sampai search bar saja)
              Container(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF5AD2B5), Color(0xFF7EE8FA)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  children: [
                    // 🔹 Tombol Scan QR di kiri
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 3,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.qr_code_scanner,
                            color: Colors.grey[800], size: 24),
                        onPressed: () {
                          // aksi scan QR di sini
                        },
                      ),
                    ),
                    SizedBox(width: 10),

                    // 🔹 Search bar
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Cari makanan",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    // 🔹 Avatar pengguna di kanan
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Colors.grey[700]),
                    )
                  ],
                ),
              ),

              // 🔹 Grid menu (dalam kotak)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: GridView.builder(
                  itemCount: menuItems.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.image, color: Colors.grey[700]),
                          ),
                          SizedBox(height: 6),
                          Text(
                            menuItems[index]['title']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // 🔹 Section Tantangan
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selesaikan tantanganmu sekarang",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 4,
                              spreadRadius: 1)
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.green.shade100,
                            child: Icon(Icons.card_giftcard,
                                color: Colors.green, size: 22),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kamu mendapatkan Discount Rp8.000 Jajan ...",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Berakhir pada 31 Okt 2025",
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 12),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Perkembangan Saya",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),

              // 🔹 Section Promo
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Jurus tagihan receh ala Irvan Toge",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 16),

              // 🔹 Scroll horizontal responsif
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16, right: 8),
                child: Row(
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: EdgeInsets.only(right: 14),
                      width: 160, // 🔸 Lingkaran diperbesar
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Image ${index + 1}",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // 🔹 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment), label: "Pembayaran"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: "Aktivitas"),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail_outline), label: "Kotak Masuk"),
        ],
      ),
    );
  }
}
