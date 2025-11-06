import 'package:flutter/material.dart';

void main() {
  runApp(const GrabPhonePage());
}

class GrabPhonePage extends StatelessWidget {
  const GrabPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () {},
          ),
          centerTitle: true,
          title: const Text(
            'Mulai',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        body: const GrabPhoneForm(),
      ),
    );
  }
}

class GrabPhoneForm extends StatefulWidget {
  const GrabPhoneForm({super.key});

  @override
  State<GrabPhoneForm> createState() => _GrabPhoneFormState();
}

class _GrabPhoneFormState extends State<GrabPhoneForm> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ponsel',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),

          // Baris input: bendera + kode + nomor
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Bagian kiri: bendera + kode negara
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/indonesia.png',
                        width: 28,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 6),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 4), // 👈 membuat posisi angka sedikit turun
                        child: Text(
                          '+62',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 70,
                    height: 1,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),

              const SizedBox(width: 12),

              // Bagian kanan: input nomor
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: '812 123 4567',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 1,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const Spacer(),

          // Teks verifikasi
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text.rich(
                TextSpan(
                  text: 'Kirim saya kode verifikasi melalui ',
                  style: TextStyle(color: Colors.black87),
                  children: [
                    TextSpan(
                      text: 'WhatsApp',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // Tombol berikutnya
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB9F6CA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Berikutnya',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
