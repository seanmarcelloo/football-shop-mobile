# Tugas 7 PBP Fasilkom UI

Nama: Sean Marcello Maheron  
NPM: 2406401792  
Kelas: F

1. Penjelasan mengenai widget tree dan hubungan parent-child  
Widget tree adalah struktur yang menyusun seluruh tampilan aplikasi Flutter. Setiap tampilan tersusun dari widget yang saling bertingkat seperti pohon. Parent widget adalah pembungkus utama yang mengatur child widget di dalamnya. Parent memberi batas ukuran dan posisi, sedangkan child menampilkan isi yang sesuai dengan ruang yang diberikan. Saat ada perubahan pada bagian tertentu, Flutter hanya membangun ulang bagian tree yang terpengaruh, bukan seluruh tampilan.

2. Widget yang digunakan dan fungsinya  
Beberapa widget yang saya gunakan pada proyek ini antara lain:
- MaterialApp: pembungkus utama aplikasi yang menyediakan tema dan konfigurasi material design.  
- Scaffold: menyediakan kerangka halaman dengan app bar dan body.  
- AppBar: menampilkan judul di bagian atas layar.  
- Padding: memberi jarak di sekitar elemen.  
- Column dan Row: mengatur susunan elemen secara vertikal dan horizontal.  
- Card: menampilkan informasi seperti nama, NPM, dan kelas dalam bentuk kartu.  
- GridView.count: menampilkan tiga tombol dalam bentuk grid tiga kolom.  
- Icon dan Text: menampilkan ikon dan teks di dalam tombol.  
- InkWell: memberikan efek gelombang saat tombol ditekan.  
- SnackBar dan ScaffoldMessenger: menampilkan pesan singkat di bagian bawah layar.  
- MediaQuery: menyesuaikan ukuran kartu dengan lebar layar perangkat.

3. Fungsi MaterialApp dan alasan menjadi root widget  
MaterialApp berfungsi sebagai wadah utama aplikasi yang mengatur tema warna, navigasi antarhalaman, dan gaya material design. Widget ini biasanya ditempatkan sebagai root karena widget lain seperti Scaffold, Theme, dan Navigator membutuhkan konteks yang disediakan oleh MaterialApp. Dengan menjadikannya root, semua elemen di dalam aplikasi dapat menggunakan konfigurasi tema dan sistem navigasi yang sama.

4. Perbedaan StatelessWidget dan StatefulWidget  
StatelessWidget digunakan ketika tampilan bersifat tetap dan tidak berubah selama aplikasi berjalan. Widget ini cocok untuk elemen yang tidak memiliki data dinamis, misalnya halaman berisi teks atau tombol statis.  
StatefulWidget digunakan ketika tampilan perlu berubah akibat interaksi pengguna atau data baru, misalnya pada form, animasi, atau counter. Pada proyek ini, MyHomePage dibuat sebagai StatelessWidget karena isi halamannya bersifat tetap dan tidak berubah saat aplikasi dijalankan.

5. Fungsi BuildContext dan penggunaannya dalam build()  
BuildContext adalah objek yang merepresentasikan posisi sebuah widget dalam struktur widget tree. Context ini digunakan untuk mengakses informasi dari parent widget seperti tema, ukuran layar, maupun Scaffold. Dalam fungsi build(), context digunakan untuk membangun tampilan dan memanggil metode seperti Theme.of(context) atau ScaffoldMessenger.of(context) agar widget dapat berinteraksi dengan elemen lain dalam aplikasi.

6. Perbedaan hot reload dan hot restart  
Hot reload digunakan untuk memperbarui tampilan aplikasi setelah ada perubahan kode tanpa menjalankan ulang program dari awal. Fitur ini mempertahankan state yang sudah ada, sehingga cocok untuk mempercepat pengembangan tampilan.  
Hot restart menjalankan ulang seluruh aplikasi dari awal, termasuk fungsi main(). Semua data sementara atau state yang tersimpan akan hilang. Fitur ini digunakan ketika terjadi perubahan besar pada struktur kode atau ketika state sudah tidak konsisten.
