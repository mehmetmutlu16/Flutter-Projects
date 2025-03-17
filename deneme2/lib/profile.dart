import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String email = "iremnurmemis123@gmail.com";
    final int totalScore = 500;
    final String profileImageUrl =
        "https://i.pinimg.com/236x/39/2e/c1/392ec133926e8d3f87326741e2e813b4.jpg";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(profileImageUrl),
                backgroundColor: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "E-posta:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),
            Text(
              "Toplam Puan:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "$totalScore puan",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 32),
            // Şifre değiştir butonu
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Şifre değiştir işlemi
                  showDialog(
                    context: context,
                    builder: (context) {
                      final currentPasswordController = TextEditingController();
                      final newPasswordController = TextEditingController();

                      return AlertDialog(
                        title: const Text("Şifre Değiştir"),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Mevcut şifre girişi
                              TextField(
                                controller: currentPasswordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: "Mevcut Şifre",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Yeni şifre girişi
                              TextField(
                                controller: newPasswordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: "Yeni Şifre",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          // İptal butonu
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("İptal"),
                          ),
                          // Tamam butonu
                          TextButton(
                            onPressed: () {
                              // Girdi verilerini al
                              final currentPassword = currentPasswordController.text;
                              final newPassword = newPasswordController.text;

                              // Şifre doğrulama mantığı (örnek)
                              if (currentPassword.isNotEmpty && newPassword.isNotEmpty) {
                                Navigator.pop(context);
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Başarılı"),
                                    content: const Text("Şifreniz başarıyla değiştirildi."),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("Tamam"),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                // Eksik giriş yapılmışsa hata göster
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Lütfen tüm alanları doldurun."),
                                  ),
                                );
                              }
                            },
                            child: const Text("Tamam"),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.lock, color: Colors.white),
                label: const Text(
                  "Şifre Değiştir",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              ),
            ),
            const SizedBox(height: 16),
            // Çıkış yap butonu
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Çıkış yap işlemi
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Çıkış Yap"),
                      content: const Text("Çıkış yapmak istediğinizden emin misiniz?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Hayır"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context); // Anasayfaya dön
                          },
                          child: const Text("Evet"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.exit_to_app, color: Colors.white,),
                label: const Text("Çıkış Yap", style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
