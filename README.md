# Tugas 7 

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

# Tugas 8
 1. Perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`
`Navigator.push()` digunakan untuk menambah halaman baru di atas halaman sebelumnya. Artinya, pengguna masih bisa kembali ke halaman sebelumnya menggunakan tombol “back”.  
Sebaliknya, `Navigator.pushReplacement()` akan mengganti halaman saat ini dengan halaman baru, jadi halaman sebelumnya dihapus dari stack dan pengguna tidak bisa kembali ke sana.

Di aplikasi Football Shop, saya menggunakan:
- `Navigator.push()` saat berpindah dari halaman utama ke halaman detail produk (karena pengguna mungkin ingin kembali melihat daftar produk).  
- `Navigator.pushReplacement()` saat berpindah ke halaman setelah form disubmit, misalnya setelah menambahkan produk baru, agar pengguna tidak bisa kembali ke form lama yang sudah disubmit.

2. Pemanfaatan hierarchy widget seperti `Scaffold`, `AppBar`, dan `Drawer`
Ketiga widget ini membantu menjaga konsistensi struktur halaman:
- `Scaffold` menjadi kerangka utama tiap halaman, yang berisi `AppBar`, `Drawer`, dan `body`.
- `AppBar` menampilkan judul halaman dan memberikan navigasi yang mudah di bagian atas.
- `Drawer` digunakan sebagai menu samping untuk berpindah antarhalaman tanpa perlu tombol tambahan.

Dengan kombinasi ini, semua halaman di Football Shop terlihat rapi dan memiliki tata letak yang seragam.

3. Kelebihan menggunakan layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView`
Ketiga widget ini berguna untuk mengatur tampilan form dan memastikan tampilannya responsif serta nyaman dibaca:
- `Padding` memberi jarak antar elemen agar tampilan tidak terlalu rapat.
- `SingleChildScrollView` memungkinkan halaman form bisa di-*scroll*, jadi tidak akan overflow di layar kecil.
- `ListView` cocok untuk menampilkan daftar input atau item yang jumlahnya banyak dan bisa digulir.

Contohnya di aplikasi saya, saat menampilkan form tambah produk, saya membungkus semua elemen dalam `SingleChildScrollView` dan `Padding` supaya pengguna tetap bisa mengisi form dengan nyaman, meski di layar kecil.

4. Penyesuaian warna tema agar aplikasi memiliki identitas visual
Untuk membuat aplikasi memiliki identitas visual yang konsisten, Flutter menyediakan sistem tema melalui properti `theme` di dalam `MaterialApp`. Ide utamanya adalah menentukan satu set warna dan gaya yang akan digunakan di seluruh halaman aplikasi, sehingga tampilan tidak berbeda-beda antarhalaman.

Misalnya, jika *Football Shop* ingin menampilkan kesan yang kuat dan energik dengan warna merah serta kesan bersih dengan warna putih, maka warna merah bisa dijadikan warna utama (misalnya untuk AppBar dan tombol), sedangkan warna putih digunakan sebagai latar belakang dan warna teks.  
Dengan begitu, pengguna akan langsung mengenali gaya khas aplikasi karena konsistensi warna yang digunakan di seluruh tampilan.

Selain warna, tema juga bisa mencakup gaya huruf, bentuk tombol, dan warna teks agar seluruh elemen UI terasa selaras dan mencerminkan karakter brand toko.

