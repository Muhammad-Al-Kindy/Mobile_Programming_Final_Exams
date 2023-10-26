# ❇️ MidTerm-Exam-Mobile-Programming ❇️
Repository untuk hasil program bahan Ujian Tengah Semester (UTS) Pemrograman Mobile Tahun Ajaran 2023-2024

# 📱 Dashboard Mobile - Project
Dashboard Data Hasil Kuisioner Mahasiswa sederhana menggunakan bahasa pemrograman dart dengan melibatkan framework Laravel sebagai backend dan Flutter sebagai framework pengembangan antarmuka pengguna (UI / User Interface).

!['Gambar Home Dashboard'](https://github.com/nikenmn/MidTerm-Exam-Mobile-Programming/blob/7749e5e8b2d4eeca933454db8c60af68f4f5397c/documentation_picture/testing1.jpg)

# 📤 Tujuan Project
1. Membuat Dashboard sederhana yang dapat menampilkan beberapa hasil data kuisioner terkait masalah komplain oleh mahasiswa. Dengan data yang ditampilkan sebagai berikut:

    a. Total pengisi survey (responden)

    b. Jumlah faktor yang dipermasalahkan (per faktor)
    
    c. Jumlah responden berdasarkan gender
    
    d. Jumlah responden berdasar negara asal
    
    e. Rata-rata umur responden total
    
    f. Rata-rata IPK (GPA) responden total
    
    g. Detil hasil survey per responden

2.  Membuat program dengan bahasa pemrograman Dart, menggunakan Framework Laravel dan Flutter

3. Mengaplikasikan pembuatan program yang berbasis fungsi (function) atau objek (OOP)


# 💿 Deskripsi dan Alur Sistem
1. Use Case Diagram
![Gambar Flowchart Main ](https://github.com/nikenmn/MidTerm-Exam-Mobile-Programming/blob/9937d9db3b145a202a0c726910669df4aa26ee22/documentation%20picture/Use%20Case%20-%20UTS%20Mobile.drawio%20(1).png)

    > Pada gambar dijelaskan bahwasanya user dapat mengakses 2 Fitur utama, yaitu Dashboard dan Laman Detail data Koresponden. Pada Dashboard, user dapat melihat hasil visualisasi data survey yang telah berhasil dihimpun. Sedangkan pada detail data koresponden, user dapat mengakses data lengkap mengenai isi survey yang dilakukan oleh mahasiswa.


2. Main Flowchart
![Gambar Flowchart Main ](https://github.com/nikenmn/MidTerm-Exam-Mobile-Programming/blob/9937d9db3b145a202a0c726910669df4aa26ee22/documentation%20picture/flowchart%20main.png)

    > Flowchart diatas menjelaskan alur utama pada sistem. Dimulai dari pengolahan data. Sistem akan melakukan pengolahan data dengan melakukan kalkulasi dan pembuatan char.

    > Selanjutnya, hasil dari pengolahan akan tampil pada sistem.

    > User melakukan pilihan tindakan untuk penampilan data lanjutan. Apabila user memilih penampilan detail data koresponden, maka sistem akan melakukan eksekusi method detailData(). Namun, jika tidak, proses selesai.

2. Flowchart olahData()
![Gambar FLowchart Fungsi olahData](https://github.com/nikenmn/MidTerm-Exam-Mobile-Programming/blob/9937d9db3b145a202a0c726910669df4aa26ee22/documentation%20picture/olahdata.png)
    > a. Dilakukan grab data pada database

    > b. Mengakses List data hasil survey

    > c. Melakukan data kalkulasi, apabila menghitung banyaknya data pada suatu variabel, maka dilakukan fungsi count(). Namun, apabila dilakukan perhitungan jumlah rerata, maka dilakukan kalkulasi pengolahan data total terlebih dahulu. Setelahnya dilakukan kalkulasi pencarian total data spesifik dengan count. Kemudian dilakukan pembagian hasil sum() dan count()

    > d. Hasil kalkulasi akan dilakukan pengolahan untuk menampilkan data dengan chart yang dikehendaki

    > e. Program selesai

3. Flowchart detailData()
![Gambar Flowchart fungsi detailData()](https://github.com/nikenmn/MidTerm-Exam-Mobile-Programming/blob/00ddb24b67df693a20e92f45d93ec864d53d2274/documentation_picture/olahdata.png)
    > a. Dilakukan grab data pada database

    > b. Mengakses List data hasil survey

    > c. *ListView.builder* untuk membuat tampilan List yang dapat digulir. Setiap elemen dalam List diakses menggunakan data[index], dan kita mengonversinya ke dalam bentuk String dengan .toString() agar dapat ditampilkan dalam *ListTile*.

    > d. Detail data koresponden akan muncul

    > e. Apabila dipilih penampilan data lebih banyak, sistem akan mengakses fungsi *onTap()* untuk mengakses fungsi berikutnya dengan tujuan menampilkan detail data lanjutan pada row selanjutnya

# 📚 Deskripsi Folder
1. Folder `midterm_exam_mobile` berisi kode program untuk pembuatan sistem menggunakan framework Flutter dan bahasa Dart
2. Folder `uts_mobile` berisi kode program untuk pengelolaan backend melalui laravel
3. Folder `documentation_picture` berisi folder gambar dalam penampilan laporan
4. Folder `uts__mobile` pada branch `mobile-interface` berisi kode program pembentukan user interface


# 🗯️ Hasil Pengujian Program
1. Dashboard Page

    |ID | Case | Expected Result | Actual Result | Status |
    |---|------|-----------------|---------------|------|
    |USR01| Penampilan chart | Chart tampil sesuai dengan variabel permasalahan | Chart tampil sesuai dengan variabel permasalahan pada judul chart| Sesuai|
    |USR02| Penampilan data hasil Kalkulasi | Data hasil tampil tanpa adanya kegagalan kalkulasi | Data hasil tampil tanpa adanya kegagalan kalkulasi| Sesuai |
    |USR03| Penampilan detail data lanjutan | Data detail tampil sesuai dengan baris/row pada sumber data| Data detail tampil sesuai dengan baris/row pada sumber data| Sesuai |

2. Correspondence's Page Detail 

    |ID | Case | Expected Result | Actual Result | Status |
    |---|------|-----------------|---------------|------|
    |USR04| Memilih penampilan detail data koresponden | Data detail koresponden tampil sesuai dengan baris/row pada sumber data| Data detail koresponden tampil sesuai dengan baris/row pada sumber data| Sesuai|
    |USR05 | Memilih penampilan detail data lebih banyak dalam satu layar | Terjadi penambahan penampilan data detail sesuai dengan baris/row pada sumber data| Terjadi penambahan penampilan data detail sesuai dengan baris/row pada sumber data| Sesuai

    ## 💫 Hasil Tampilan Testing

    ![Dokumentasi Testing](https://github.com/nikenmn/MidTerm-Exam-Mobile-Programming/blob/00ddb24b67df693a20e92f45d93ec864d53d2274/documentation_picture/testing1.jpg)

    ![Dokumentasi Testing](https://github.com/nikenmn/MidTerm-Exam-Mobile-Programming/blob/00ddb24b67df693a20e92f45d93ec864d53d2274/documentation_picture/testing2.jpg)

    ![Dokumentasi Testing](https://github.com/nikenmn/MidTerm-Exam-Mobile-Programming/blob/00ddb24b67df693a20e92f45d93ec864d53d2274/documentation_picture/testing3.jpg)

    ![Dokumentasi Testing](https://github.com/nikenmn/MidTerm-Exam-Mobile-Programming/blob/00ddb24b67df693a20e92f45d93ec864d53d2274/documentation_picture/testing4.jpg)

    ![Dokumentasi Testing](https://github.com/nikenmn/MidTerm-Exam-Mobile-Programming/blob/07abb6846769a7154a06211a17117bf1b1ba4ced/documentation_picture/testing5.jpg)

    ![Dokumentasi Testing](https://github.com/nikenmn/MidTerm-Exam-Mobile-Programming/blob/07abb6846769a7154a06211a17117bf1b1ba4ced/documentation_picture/testing6.png)

# 🗨️ Dokumentasi Pengembangan Sistem
1. Designing User Interface

![Dokumentasi Design Interface](https://github.com/nikenmn/MidTerm-Exam-Mobile-Programming/blob/3695ee0601cd195c18c7156f9b93869153b31925/assets/doc2.png)

2. Coding Interface

![Dokumentasi Coding Interface](https://github.com/nikenmn/MidTerm-Exam-Mobile-Programming/blob/3695ee0601cd195c18c7156f9b93869153b31925/assets/doc3.png)

3. Coding System

![Dokumentasi Pengkodingan Sistem](https://github.com/nikenmn/MidTerm-Exam-Mobile-Programming/blob/00ddb24b67df693a20e92f45d93ec864d53d2274/documentation_picture/coding.png)


4. Group's Meeting

![Dokumentasi Group's Meeting](https://github.com/nikenmn/MidTerm-Exam-Mobile-Programming/blob/3695ee0601cd195c18c7156f9b93869153b31925/assets/doc1.png)


5. Testing System

![Dokumentasi Group's Meeting](https://github.com/nikenmn/MidTerm-Exam-Mobile-Programming/blob/07abb6846769a7154a06211a17117bf1b1ba4ced/documentation_picture/testingdoc.jpg)


# 💥 Contributor
    Kelompok 6 SIB 3E
    1. Niken Maharani Permata - 2141762006 / 19
        Peran : UI Designer dan Technical Writer
    2. Muhammad Al Kindy - 2141762057 / 14
        Peran : Backend and Frontend Developer
    3. Laita Zidan
        Peran : 'Expected' Frontend Developer = 0% contribution






