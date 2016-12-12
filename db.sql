-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 12, 2016 at 08:40 PM
-- Server version: 5.5.46-0ubuntu0.14.04.2
-- PHP Version: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `houtell`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kota` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `nama_kota`) VALUES
(1, 'Jakarta'),
(2, 'Bandung'),
(3, 'Bali');

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE IF NOT EXISTS `hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_hotel` varchar(300) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `rating` decimal(10,0) DEFAULT NULL,
  `bintang` tinyint(4) NOT NULL,
  `url_foto` varchar(200) DEFAULT NULL,
  `lokasi` varchar(100) DEFAULT NULL,
  `canonical_name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`id`, `nama_hotel`, `id_kota`, `rating`, `bintang`, `url_foto`, `lokasi`, `canonical_name`) VALUES
(6, 'Hotel Orchardz Bandara', 1, NULL, 3, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000420085_dh', 'Jakarta Barat', 'hotel-orchardz-bandara'),
(7, 'Menara Peninsula Hotel Jakarta', 1, NULL, 4, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000002336_dh', 'Jakarta Barat', 'menara-peninsula-hotel-jakarta'),
(8, 'Hotel Santika Premiere Slipi Jakarta', 1, NULL, 4, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000143495_dh', 'Jakarta Barat', 'hotel-santika-premiere-slipi-jakarta'),
(10, 'Zest Hotel Airport Jakarta', 1, NULL, 2, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000177019_dh', 'Jakarta Barat', 'zest-hotel-airport-jakarta'),
(11, 'Big Hotel Jakarta', 1, NULL, 3, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000012473_dh', 'Jakarta Barat', 'big-hotel-jakarta'),
(12, 'The Jayakarta Jakarta', 1, NULL, 4, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000447981_dh', 'Jakarta Barat', 'the-jayakarta-jakarta'),
(13, 'Mega Anggrek Hotel', 1, NULL, 3, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000041228_dh', 'Jakarta Barat', 'mega-anggrek-hotel'),
(14, 'Hotel Santika Premiere Hayam Wuruk Jakarta', 1, NULL, 4, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000202759_dh', 'Jakarta Barat', 'hotel-santika-premiere-hayam-wuruk-jakarta'),
(16, 'Amaris Hotel - Bandara Soekarno Hatta', 1, NULL, 2, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001010104458_dh', 'Jakarta Barat', 'amaris-hotel---bandara-soekarno-hatta'),
(17, 'POP! Hotel Airport Jakarta', 1, NULL, 2, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000069731_dh', 'Jakarta Barat', 'pop!-hotel-airport-jakarta'),
(18, 'Hotel 88 Grogol Jakarta', 1, NULL, 2, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000002000334080_dh', 'Jakarta Barat', 'hotel-88-grogol-jakarta'),
(19, 'Hotel Kaisar Jakarta', 1, NULL, 3, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000018398_dh', 'Jakarta Selatan', 'hotel-kaisar-jakarta'),
(20, 'Manhattan Hotel', 1, NULL, 5, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000000777_dh', 'Jakarta Selatan', 'manhattan-hotel'),
(22, 'Maharadja Hotel', 1, NULL, 3, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000007838_dh', 'Jakarta Selatan', 'maharadja-hotel'),
(23, 'Century Park Hotel', 1, NULL, 4, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000002000145207_dh', 'Jakarta Selatan', 'century-park-hotel'),
(24, 'Grand Whiz Poins Square Simatupang', 1, NULL, 4, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000002000251826_dh', 'Jakarta Selatan', 'grand-whiz-poins-square-simatupang'),
(25, 'Diradja Hotel', 1, NULL, 3, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000053128_dh', 'Jakarta Selatan', 'diradja-hotel'),
(26, 'Grand Royal Panghegar', 2, NULL, 4, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000085549_dh', 'Bandung', 'grand-royal-panghegar'),
(27, 'Aston Pasteur', 2, NULL, 4, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000002000010750_dh', 'Bandung', 'aston-pasteur'),
(28, 'Grandia Hotel Bandung', 2, NULL, 4, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000233484_dh', 'Bandung', 'grandia-hotel-bandung'),
(29, 'The Trans Luxury Hotel', 2, NULL, 5, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000094695_dh', 'Bandung', 'the-trans-luxury-hotel'),
(30, 'Park View Hotel', 2, NULL, 4, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000328838_dh', 'Bandung', 'park-view-hotel'),
(31, 'GH Universal Hotel', 2, NULL, 5, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000002000136887_dh', 'Bandung', 'gh-universal-hotel'),
(32, 'ibis Bandung Trans Studio', 2, NULL, 3, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000002000113469_dh', 'Bandung', 'ibis-bandung-trans-studio'),
(33, 'Clove Garden Hotel & Residence', 2, NULL, 4, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000240442_dh', 'Bandung', 'clove-garden-hotel-&-residence'),
(34, 'Hotel Savoy Homann Bidakara', 2, NULL, 4, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000002000160011_dh', 'Bandung', 'hotel-savoy-homann-bidakara'),
(35, 'Best Western Premier La Grande Hotel', 2, NULL, 4, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000272688_dh', 'Bandung', 'best-western-premier-la-grande-hotel'),
(36, 'Meize Hotel', 2, NULL, 3, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000163076_dh', 'Bandung', 'meize-hotel'),
(37, 'Grand Sovia Hotel Bandung', 2, NULL, 3, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000009847_dh', 'Bandung', 'grand-sovia-hotel-bandung'),
(38, 'Atanaya by Century Park', 3, NULL, 4, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000257816_dh', 'Badung', 'atanaya-by-century-park'),
(39, 'Horison Legian', 3, NULL, 4, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000002000188944_dh', 'Badung', 'horison-legian'),
(40, 'Best Western Kuta Beach', 3, NULL, 3, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000279207_dh', 'Badung', 'best-western-kuta-beach'),
(41, 'INAYA Putri Bali', 3, NULL, 5, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000183721_dh', 'Badung', 'inaya-putri-bali'),
(42, 'Mulia Resort', 3, NULL, 5, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000093079_dh', 'Badung', 'mulia-resort'),
(43, 'Ramada Bintang Bali Resort', 3, NULL, 5, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000116912_dh', 'Badung', 'ramada-bintang-bali-resort'),
(44, 'Mega Boutique Hotel & Spa', 3, NULL, 4, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000217198_dh', 'Badung', 'mega-boutique-hotel-&-spa'),
(45, 'MaxOneHotels at Seminyak', 3, NULL, 3, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000236037_dh', 'Badung', 'maxonehotels-at-seminyak'),
(46, 'The Edelweiss Boutique Hotel Kuta', 3, NULL, 4, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000002000007413_dh', 'Badung', 'the-edelweiss-boutique-hotel-kuta'),
(47, 'Inna Grand Bali Beach', 3, NULL, 5, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000500542_dh', 'Sanur', 'inna-grand-bali-beach'),
(48, 'Lv8 Resort Hotel', 3, NULL, 5, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000001000015940_dh', 'Badung', 'lv8-resort-hotel'),
(49, 'Siesta Legian Hotel by Avilla Hospitality', 3, NULL, 3, 'http://d1nabgopwop1kh.cloudfront.net/hotel-asset/30000002000011367_dh', 'Badung', 'siesta-legian-hotel-by-avilla-hospitality');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review` text NOT NULL,
  `rating` decimal(3,1) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `reviewer` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=223 ;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `review`, `rating`, `hotel_id`, `reviewer`) VALUES
(2, 'iya ini sangat bagus ya wow', 9.0, 1, NULL),
(3, 'Cukup memuaskan (rekomendasi) untuk kelas bintang 3.', 10.0, 5, NULL),
(4, 'Memuaskan dan strategis dekat dengan bandara', 9.7, 5, NULL),
(5, 'Hotel dekat airport hub, nyaman, ada transport babdara tiap jam gratis. Sempet AC tidak dingin, namun setelah komplain AC bisa diperbaiki lagi. Overall memuaskan.', 9.1, 5, NULL),
(6, 'Hotel yang pas untuk transit bagi keluarga.', 8.8, 5, NULL),
(7, 'Kamarnya bersih, pelayanan memuaskan, hanya saja fasilitas yang disediakan kurang lengkap seperti shower cap di kamar mandi belum ada.. ', 10.0, 5, NULL),
(8, 'Kamarnya kuno, kasurnya kurang nyaman. ', 8.3, 6, 'Masudi J.'),
(9, 'Aku suka bgt. Tempat gym nya nyaman, terus ada jacuzzi nya juga d kamar mandinya. Udah gitu kolam renangnya bagus bgt. Suka pokonyaa. kalau di kamarnya nyaman kok. Kasurnya empuk juga', 9.1, 6, 'Prasthi A.'),
(10, 'Pelayanan tidak memuaskan, masalah jam cek out', 6.0, 6, 'Lies T.'),
(11, 'Dekat kemana mana dan bersih kamarnya', 10.0, 6, 'Hadi S.'),
(12, 'Tingkatkan lagi kebersihan kamar, masih ada sudut2 yang berdebu.', 8.4, 6, 'R T. S.'),
(13, 'Lokasi strategis, bersih, suasana nyaman, menu makanan cukup variatif.', 8.5, 7, 'Elly Y.'),
(14, 'Kamar bagus dan pelayanan ramah. Thanks Santika!', 9.4, 7, 'Medha P.'),
(15, 'Sejak tahun 1998 kalau ke Jakarta ya selalu ke hotel santika slipi, mulai urusan kantor, hadiri acara teman mantu sampai acara liburan. Alasannya ya nyaman saja disana. Kemana mana berasa dekat. Karyawannya ramah, makan paginya komplit', 9.4, 7, 'Ruliana A.'),
(16, 'Kurang memuaskan terhadap pelayanan di tempat makan pagi. Pelayan tidak sigap. Pelayan melayani dengan buruk.', 7.0, 7, 'Zul H.'),
(17, 'Lokasinya dekat sekali dengan tujuan bisnis saya.', 9.7, 7, 'Dhani A.'),
(18, 'Dekat dengan airport dan shuttle tersedia setiap jam', 8.5, 8, 'Jenti W.'),
(19, 'Bersih, nyaman, dekat bandara, sesuai yang dibutuhkan', 9.7, 8, 'Akhmad H.'),
(20, 'Bagus pelayanan dan letaknya strategis.', 9.7, 8, 'Ming C.'),
(21, 'Sikat gigi tidak tersedia sikat gigi, kamar mandi licin.', 5.4, 8, 'Edy P.'),
(22, 'Sesuai dengan harga, saya tidak pesan kamar + sarapan', 8.5, 8, 'Filius C.'),
(23, 'Dekat dengan airport dan shuttle tersedia setiap jam', 8.5, 9, 'Jenti W.'),
(24, 'Bersih, nyaman, dekat bandara, sesuai yang dibutuhkan', 9.7, 9, 'Akhmad H.'),
(25, 'Bagus pelayanan dan letaknya strategis.', 9.7, 9, 'Ming C.'),
(26, 'Sikat gigi tidak tersedia sikat gigi, kamar mandi licin.', 5.4, 9, 'Edy P.'),
(27, 'Sesuai dengan harga, saya tidak pesan kamar + sarapan', 8.5, 9, 'Filius C.'),
(28, 'Wifi kurang memuaskan lemah tolong ditingkatkan pelayanannya', 9.0, 10, 'Adnan F.'),
(29, 'Kurang bagus karena pintunya rusak susah terbuka dan susah tertutup. ', 6.1, 10, 'Tamba T.'),
(30, 'Baik. Bersih dan ramah dekat dengan pusat hiburan', 8.5, 10, 'Rony R.'),
(31, 'Nyaman, enak, bersih, cuma airnya kuning.', 8.5, 10, 'Adi M. M.'),
(32, 'Secara keseluruhan bagus, pelayanan ramah, dan pelayanan cepat, sayang kurang adanya sliper di kamar. Room servicenya juga enak makanannya.', 8.5, 10, 'Sudiro S.'),
(33, 'Lokasi strategis, pelayanan lumayan memuaskan, sarapan paginya cukup lah, menunya standart, kebersihan mengecewakan, banyak lipas di kamar hotel, mengerikan sekali.', 8.4, 11, 'Nophan H.'),
(34, 'Kamar banyak coreran tidak jelas!', 4.8, 11, 'Satya P.'),
(35, 'Sudah bagus mungkin di perhatikan lagi kondisi kamar yang mungkin ada untuk barang-barang yang di ganti baru. Thanks. ', 8.5, 11, 'Maura M.'),
(36, 'Luas kamarnya, mini bar bsr,isi full, sarapan banyak pilihan, rasa makanannya enak. ', 8.5, 11, 'Sribudiarti R.'),
(37, 'Kamar yang disediakan tidak sesuai pesanan', 6.0, 11, 'Djonny M.'),
(38, 'Suasana penerangan dan tampilan furniturenya terkesan gelap.', 9.7, 12, 'Junaidy J.'),
(39, 'Terlalu jauh kamar dari lift dan lobby, dari lobby lift jauh berjalan, sehingga kami sudah lelah tambah lelah.', 5.7, 12, 'Yuliantie Y.'),
(40, 'Bagus cuma kolam renangnya itu sepertinya harus dibersihkan, saya cukup nyaman disana, receptionist dll ramah banget.', 9.4, 12, 'Nurfadhilah N.'),
(41, 'Hotel dengan kesan tua dan remang. Pelayanan standard, wifi di lantai atas kadang hilang. Mungkin lebih cocok untuk yang ingin berbisnis di sekitar jakarta barat', 8.4, 12, 'Petra A.'),
(42, 'Recommend lah buat liburan. ', 9.7, 12, 'Fathurrahman F.'),
(43, 'Makanannya beragam dan pelayanannya cepet.', 10.0, 13, 'Ida F. H.'),
(44, 'Pelayanan semoga bisa lebih baik lagi', 6.1, 13, 'Fina F.'),
(45, 'Hotel yang bagus untuk tinggal di jakarta', 9.7, 13, 'Budi H.'),
(46, 'Bersih, nyaman dan pelanyanan ramah-tamah.', 10.0, 13, 'Tati S.'),
(47, 'Kamarnya untuk ukuran premier termasuk kecil, kolam renang juga terlalu kecil serta pilihan breakfast tidak setara dengan kelas premiere.', 8.3, 13, 'Nike C. S.'),
(48, 'Tempatnya bagus dan nyaman untuk berlibur', 10.0, 14, 'Hellen R. E.'),
(49, 'Bagus bersih pelayanan nya super.makanan agak mahal', 8.5, 14, 'Benny B.'),
(50, 'Kamar kecil, gelap, dan jauh dari lobi.', 5.5, 14, 'Cynthia A. T.'),
(51, 'Ramah & nyaman, sesuai dengan harga', 10.0, 14, 'Indra S. N.'),
(52, 'Ada nyamuk Keempat bantal terlalu tipis (sakit leher keesokan harinya) Pintu kaca shower terlalu pendek sehingga membuat seluruh kamar mandi basah setelah mandi', 5.8, 14, 'Suska A. K.'),
(53, 'Saya diantar jemput bandara. Oke mantap. ', 8.5, 15, 'Dona P.'),
(54, 'Standar. Tempat makan di luar hotel dan tidak dapat memesan makan dr room.', 6.9, 15, 'Agung W.'),
(55, 'Lumayan bagus, yang perlu diperbaiki kondisi ruangan sarapan pagi', 8.5, 15, 'Tarmudi T.'),
(56, 'Sebenarnya lokasinya deket dari bandara, tapi airnya yang bermasalah bau banget dan berwarna kuning.', 6.7, 15, 'Umar U.'),
(57, 'Ada telp tp tdk disediakan no apa yg bisa dihubungi termasuk hanya utk sekedar bertanya kpd resepsionis. Air panasnya tdk keluar.', 6.0, 15, 'Yuliarsih Y.'),
(58, 'Cocok untuk transit, harga terjangkau.', 8.7, 16, 'Purwanto P.'),
(59, 'Makan perlu lebih variasi, shuttle bus hotel ke bandara sebaiknya 30 menit.', 9.4, 16, 'V S. S.'),
(60, 'Kamarnya tempat tidurnya kurang bersih, sepanjang malam tidak tidur karena gatal2, ditambah suara2 gaduh entah dr kamar sebelah atau dr OB cukup ganggu istirahat.', 8.3, 16, 'Junita M.'),
(61, 'Bagus dekat dengan bandara ada bis shuttle juga', 7.0, 16, 'Yusep S.'),
(62, 'Di kamar tidak ada tlf,tidak ada handuk terus uang parkir tidak free untuk tamu dan tukang parkir minta pembayaran parkir sekitar 20rb an', 5.8, 16, 'Yulida H. E.'),
(63, 'Hotel dengan harga wajar dilokasi bagus cuma parkir terbatas', 8.5, 17, 'Yayang Y.'),
(64, 'Cukup baik dan nyaman dekat lokasi mall', 8.5, 17, 'Djunaidi M.'),
(65, 'Tempatnya bagus, strategis, pelayanan kamar juga cukup memuaskan. Cuma lebih diperhatikan untuk sandal, saya mendapatkan sandal bukan sepasang, tapi kiri semua. Tapi selebihnya bagus untuk hotel ini. Sarapan pun menunya cukup memuaskan.', 8.5, 17, 'Fauzan F.'),
(66, 'Cukup bersih dan fasilitas lengkap.', 9.4, 17, 'Arif A.'),
(67, 'Bersih, nyaman, AC dingin.. Kualitas jauh melebihi harga', 9.7, 17, 'Rimo S.'),
(68, 'Bagus. Memuaskan. Keluhannya paling Wifi nya gak bisa. Selebihnya bagus.', 9.4, 18, 'Lukman H. H.'),
(69, 'Harga hotel cukup murah dan lokasi cukup strategis, tapi ruangan hotel sangat tidak bersih, tisu tidak tidak ada, bau abu rokok sangat mengganggu dan macam tidak di vakum di stiap lt lift,...sangat membuat sesak. Untuk di resto pun pemanggang roti tak ada, sangat tidak memuaskan.', 5.4, 18, 'Ceryna A.'),
(70, 'Tidak menyediakan termos pemanas air minum dan pelayanan kurang ramah.', 6.2, 18, 'Rahmad E.'),
(71, 'Sayangnya pas ada angin kencang suaranya membuat berisik seperti siulan di jendela jadi agak mengganggu, overall sih fine.', 9.1, 18, 'Ratmoko E. S.'),
(72, 'Pendingin ruangan tidak dingin sama sekali.', 5.4, 18, 'Muhamad I. S.'),
(73, 'Kamarnya besar, leluasa, fasilitas komplit, banyak jenis makanan/minuman nya, dekat dengan perkantoran sehingga harus tau jam-jam macet menuju/kearah hotel ini.', 9.1, 19, 'Heri B.'),
(74, 'Cukup memuaskan Sayang makanannya sangat standar', 9.3, 19, 'Revlisianto S.'),
(75, 'Mantap sesuai dengan budget sip. ', 9.4, 19, 'Hermanto A. W.'),
(76, 'Ada kecoa di kamar mandi, untungnya saya bisa minta pindah kamar. Secara umum kamar agak kotor.', 5.7, 19, 'Rahadimas P. N. B.'),
(77, 'Ada banyak hal mengecewakan di hotel ini terkait pelayanannya. Pertama, ketika masuk ke kamar yang saya pesan, tidak ada handuk untuk mandi dan handuk lantai untuk mengeringkan kaki. Harus dua kali menelepon housekeeping, baru handuk diantarkan. Kedua, menu makanannya. Astaga, dibandingkan dengan hotel bintang empat di bilangan Senayan, jauh sekali Manhattan ini ketinggalan. Pilihan menu terbatas dan ya... Masakannya jauh dari kata lezat berselera. Ketiga, saat check out "mudah" saja. Saya dimintai kartu kunci kamar lalu petugas bilang, "Bapak, nanti deposite yang dari kartu kredit Anda akan kami close. Terima kasih." Sudah gitu aja. Deposite 500 ribu dari kartu kredit itu tidak terjelaskan sudah dibatalkan apa belum. Yang jelas, saya dipersilakan check out dan nanti di tengah jalan saya menuju ke rumah deposit akan diurus. Well, tidak mungkin saya kembali ke hotel ini. Maaf, itulah yang saya rasakan.', 5.8, 19, 'Wayan D.'),
(78, 'Servicenya mengecewakan, itu tukang cleaning roomnya kalau ngga dikasih tip kamar saya gak dibersihkan, room service diminta sendok malah marah2x, dikomplain mereka yang marah, jorok banget.', 5.8, 20, 'Ernest S.'),
(79, 'Cukup bagus, kalo bisa teh dan kopi disiapkan dalam kamar.', 8.5, 20, 'Wa O. N. N.'),
(80, 'Tempatnya strategis dan rate biayanya sepadan', 8.5, 20, 'Mada A. W.'),
(81, 'Pelayanan kurang ramah, tingkatkan lagi pelayanan dan kebersihan hotel.', 6.0, 20, 'Deni D.'),
(82, 'Kamar mandi nya kurang bersih. Resepsionisnya tidak friendly', 6.7, 20, 'Handrianto H.'),
(83, 'Servicenya mengecewakan, itu tukang cleaning roomnya kalau ngga dikasih tip kamar saya gak dibersihkan, room service diminta sendok malah marah2x, dikomplain mereka yang marah, jorok banget.', 5.8, 21, 'Ernest S.'),
(84, 'Cukup bagus, kalo bisa teh dan kopi disiapkan dalam kamar.', 8.5, 21, 'Wa O. N. N.'),
(85, 'Tempatnya strategis dan rate biayanya sepadan', 8.5, 21, 'Mada A. W.'),
(86, 'Pelayanan kurang ramah, tingkatkan lagi pelayanan dan kebersihan hotel.', 6.0, 21, 'Deni D.'),
(87, 'Kamar mandi nya kurang bersih. Resepsionisnya tidak friendly', 6.7, 21, 'Handrianto H.'),
(88, 'Ruang kamar yg luas, good view & pelayanan ramah.', 9.4, 22, 'Vidi S. F. A.'),
(89, 'Bagus dan nyaman dekat ke mal Senayan', 10.0, 22, 'Hamsah H.'),
(90, 'Bagus , bersih, saya suka menginap disini. ', 10.0, 22, 'Fenny F.'),
(91, 'nyaman dan memuaskan kamarnya bersih dan pelayanannya ok', 10.0, 22, 'Husnul H. N. S.'),
(92, 'Bagus lokasi pusat kota harga terjangkau', 9.1, 22, 'Jeffry J.'),
(93, 'Lokasinya strategis karena dekat sama banyak mall, tapi karena macet jadi males kmn", tapi hotel bagus, bersih dan tidak berisik hotelnya. Pelayannya ramah", kalau makanan biasa aja sih, tapi senang menginap disini.', 9.1, 23, 'Nurdiah N.'),
(94, 'Kurang nyaman dan mengecewakan.', 5.8, 23, 'Rochjanto H. S.'),
(95, 'Untuk  pelayanan bagus tapi akses untuk mau jalan-jalan macet', 7.0, 23, 'Juniarti P.'),
(96, 'Oke tapi AC nya panas, tolong dicek tiap kamar', 8.7, 23, 'Rozi H.'),
(97, 'Petunjuk ke lobby tidak ada, check in lama, dari lobby ke lift jauh dan tidak jelas, security tidak ramah.', 5.9, 23, 'Enja N.'),
(98, 'Hotel nyaman, cuma karena ada pembangunan jalan layang jadi macet.', 8.4, 24, 'Bambang S.'),
(99, 'Pilih kamar Junior suite, masuk kamar mandi sabun malah kosong ga ada sama sekali, parkir jg bagi yg menginap walaupun karcis parkir sudah di lapor ke receptionist tp tetap saja masih bayar', 5.5, 24, 'Raiza F.'),
(100, 'Tempat nyaman, dekat dengan kota, kalau malam banyak kuliner yang dekat. Good service!!', 9.4, 24, 'Wieke M.'),
(101, 'Mohon respon dari receptionist lebih cepat dan aktif.', 8.5, 24, 'Medyanto P.'),
(102, 'Kamar bersih dan nyaman..makanan enak...harga lumayan murah..', 10.0, 24, 'Putut K. S.'),
(103, 'Hotel yang nyaman dan bagus, terima kasih.', 8.5, 25, 'Shelina O. '),
(104, 'Tempat strategis , fasilitas gym terbaik di kota Bandung dan kolam renang terbaik dengan air hangat', 7.3, 25, 'Acep D. N. '),
(105, 'Menu sarapan paginya tidak memuaskan.', 7.0, 25, 'Alvin H. H. '),
(106, 'Hotelnya bagus, pelayanannya baik, makanannya juga enak dan lengkap', 9.7, 25, 'Mariam P. A. '),
(107, 'Alhamdulillah sangat baik untuk berlibur. Kolam renangnya bersih dan nyaman.', 9.1, 25, 'Rohmat M. '),
(108, 'Kelebihan: Kamar bersih, breakfast cukup bervariatif, lokasi cukup baik (diluar wilayah car free day), parkiran cukup memadai, walaupun agak sempit Kekurangan: kamar kurang kedap sehingga suara orang berbicara diluar kamar cukup terdengar, suara motor/mobil dari jalanan juga masih terdengar (kamar lantai 7) Beberapa lift sedang dalam maintenance saat kunjungan, sehingga harus sabar antri untuk naik dan turun, namun tim Hotel bekerja dengan cepat sehingga perbaikan cukup cepat selesai', 8.7, 26, 'Alvin P. K. '),
(109, 'Bagus bersih berbunga dan indah nyaman', 10.0, 26, 'Arifin A. '),
(110, 'Hotel yang sangat strategis. Depan BTC. Akses mudah kemanapun anda akan bepergian sekitar kota Bandung. Tersedianya smoking room, namun saya tidak tau apakah tersedia smoking room dengan view kearah BTC. Yang pasti Hotel Aston ini sangat memuaskan', 8.5, 26, 'Gulmat P. '),
(111, 'Nyaman, enak, dekat dengan tempat shopping, lokasinya tidak jauh dari gerbang tol', 8.5, 26, 'Dewinda D. '),
(112, 'Lift ada 4 unit, 2 tidak dioperasikan 1 rusak, padahal sedang weekend jadi tamu sempat numpuk untuk menggunakan lift. Di dalam kolam renang dewasa ada kabel kabel yang mencuat dari instalasi lampu kolam, itu berbahaya. Secara umum bagus, tapi maintenance-nya harus lebih ditingkatkan lagi.', 8.5, 26, 'Nia N. K. '),
(113, 'Lebih enak lagi kalau dikasih karpet ya di setiap kamar, agar lebih nyaman lagi.', 8.5, 27, 'Liha L. '),
(114, 'Keseluruhan baik.. hanya saja di balkon ada beberapa puntung rokok yg tidak dibersihkan..', 9.7, 27, 'Sevianti P. '),
(115, 'Sangat memuaskan, nyaman dan bersih.', 10.0, 27, 'Nurman S. '),
(116, 'Semoga bisa nginep di Grandia Hotel Bandung. Servicenya mantep! Seperti hotel2 bintang 5.', 10.0, 27, 'Ammelia R. '),
(117, 'Lokasi mudah ditemukan dekat dengan tol keluar bandung, parkir luas .. Kamar nyaman dan makanannya pun enak', 9.1, 27, 'Dina M. '),
(118, 'Sangat nyaman dan fasilitas yang lengkap.', 9.7, 28, 'Citra C. '),
(119, 'Lokasi dekat Trans Studio. Kamarnya nyaman, breakfast enak dan yang paling bagus adalah swimming pool air hangatnya yang dilengkapi dengan pasir putih sehingga anak-anak sangat betah. Service dari seluruh staff juga sangat baik dan sangat membantu.', 10.0, 28, 'Happy M. W. '),
(120, 'Pengalaman yang seru dan mamuaskan liburan bersama keluarga ditrans luxury hotel bandung, terutama kolam renangnya yang begitu indah dan nyaman berpasir putih berbeda dengan hotel yang lainnya.', 10.0, 28, 'Ersyam P. '),
(121, 'Mantab super sekali nyaris sempurna.. Break fast nya tidak dicoba semua saking banyaknya tidak akan rugi dengan harga segitu', 9.7, 28, 'Tomy T. '),
(122, 'Pelayanannya sesuai harga.. Bersih.. Nyaman.. Eksklusif.. Terpadu dengan mall dan trans studio..bakal balik kesini lagi... Cuma rasa makanan perlu dievaluasi lagi. Trims', 9.7, 28, 'Natal S. M. S. '),
(123, 'Menginap di parkview nyaman banget meski ada beberapa catatan antara lain sinyal wifi lemah, kolam renang dingin karena lagi week day jadi anakku tidak bisa renang lama, dan terlalu sangat kecil jadi lebih cocok jadi tempat bermain anak, makanan enak hanya kurang pilihan, kamar tidak kedap suara, AC berisik, tapi kamar sangat nyaman, semua masih dalam.kondisi sangat baik, bersiihh bgt, bednya empuk bgt, enak deh pokonya, spot fotonya ok, pelayanan sangat ok, tq parkview.', 8.8, 29, 'Liani R. '),
(124, 'Bagus banget konsep hotelnyaa dan pelayanannya ramah-ramah. ', 10.0, 29, 'Anisa A. '),
(125, 'Design kamarnya bagus dan makanannya enak.', 8.5, 29, 'Deni N. '),
(126, 'Good overall. Tapi selimut dan bantalnya ada bercak2 hitam.', 8.4, 29, 'Kiki A. '),
(127, 'Besok mau pergi lagi, tempat nya keren', 9.4, 29, 'Yulifong Y. '),
(128, 'Bagus hotel dan pelayananya.', 8.5, 30, 'Fitri A. '),
(129, 'Semuanya bagus. Bersih, ramah, makanan enak, banyak spot foto. 9 out of 10.', 10.0, 30, 'Asri S. P. '),
(130, 'Suasananya nyaman, pemandangannya indah, pelayanannya baik. Tapi, kamarnya sempit, fasilitas untuk anak-anak minim, terlebih tanpa kolam renang air hangat.', 7.0, 30, 'Sella P. G. '),
(131, 'Pertama tahun  2010/11 pernah menginap disini ursan kantor... biasa aja cuma emang bangunan nya keren tapi kemaren november coba pergi sama keluarga alhasil #kids voice... Nyaman & senang. Pelayanan kayaknya lebih ramah dari pertama datang dan yang peling penting makanannya mantap. ', 9.7, 30, 'Imran S. '),
(132, 'Interior hotelnya keren banget. Viewnya bagus untuk foto", staffnya ramah", menu makanannya banyak & enak".', 10.0, 30, 'Lita S. '),
(133, 'kamar tidak kedap suara (berisik), sikat+pasta gigi tidak disediakan & harus telpon house keeping,kamar terlalu sempit', 5.2, 31, 'Agung R. P. '),
(134, 'Sangat memuaskan sekali dan akan kembali', 9.7, 31, 'Mularanto M. '),
(135, 'Menjadi hotel favorit kalau saya ke Bandung. ', 8.5, 31, 'Linda S. '),
(136, 'Kamar hotel sempit, sehingga sulit untuk menempatkan extra bed/matras.', 9.0, 31, 'Nur I. '),
(137, 'Hotel yang bagus dengan segala fasilitas yang memuaskan.', 8.5, 31, 'Wahyu H. '),
(138, 'Jaraknya jauh dari keramaian. Hanya cocok untuk org yang memang bikin acara khusus di hotel.', 8.3, 32, 'Iis E. '),
(139, 'Menyenangkan, nyaman, dan staf clove cepat pelayanannya.', 9.1, 32, 'Pupuh T. '),
(140, 'Taman yang bagus untuk bersantai ria', 8.5, 32, 'Inu K. W. K. '),
(141, 'Pemandangan saat malam ok banget. Pelayan agak jutek', 9.0, 32, 'Herdy A. Y. '),
(142, 'Recommended place buat keluarga yang pgn liburan menginap jauh dari hiruk pikuk kota, mulai dari check in, pelayanan kamar,pelayanan saat makan siang maupun sarapan dan check out sangat memuaskan. Terima kasih', 8.5, 32, 'Gun G. G. '),
(143, 'Kamar deluxe terlalu kecil, junior suitenya oke.', 8.5, 33, 'Arief D. B. '),
(144, 'Saya sebagai tamu di hotel tersebut menghimbau untuk meningkat kan pelayanan yang mungkin lebih baik lagi, terima kasih', 8.5, 33, 'Helmina H. '),
(145, 'Hotel recommended di bandung pokoknya apalagi tempatnya di jalan asia afrika keren pokonya tidak bakalan nyesel pokonya apalagi stay nya di junior suites bagus banget kamarnya, sayang belum bisa nyobain sarapan paginya karena kebablasan bangunnya. ', 10.0, 33, 'Dadang D. '),
(146, 'Hotelnya sangat tua, ornamen di kamar mandi kurang terawat, pelayanannya sangat bagus.', 9.1, 33, 'Uzia S. '),
(147, 'Posisi yang strategis. Kamarnya bagus dan nyaman. Makanan yang enak. Harga tidak mahal. ', 10.0, 33, 'Bambangsurya B. '),
(148, 'Bagus dan memuaskan dari segala hal.', 10.0, 34, 'Yudha Y. '),
(149, 'Baik sekali tapi harganya masih mahal.', 8.5, 34, 'Gunawan B. '),
(150, 'Strategis (tengah kota, dekat mall2), bersih, kamar besar, furniture mewah. ', 9.4, 34, 'Marwoto N. '),
(151, 'Good...restorannya lengkap menunya', 8.5, 34, 'Muhammad H. '),
(152, 'Bagus, nyaman tapi sayang parkirnya susah', 8.8, 34, 'Firman F. '),
(153, 'Ternyaman banget, tempatnya strategis servicenya oke.. sesuailah dengan harganya', 9.7, 35, 'Siti Z. '),
(154, 'Pas dengan kantong dan sesuai deskripsi.', 8.8, 35, 'Firza R. D. P. '),
(155, 'Secara umum OK. Lokasi lumayan strategis krn dekat kemana2, kamar lumayan bersih, pelayanan juga baik dan reasonable price.', 8.5, 35, 'Johannes L. '),
(156, 'Pelayanan memuaskan dan staff hotel ramah', 8.5, 35, 'Debri A. '),
(157, 'Hotelnya nyaman, tenang dan bersih. Satu saja yang membuat kamarnya seperti kamar rumah biasa adalah Air conditionernya masih menggunakan AC split biasa. Overall Puas.', 8.5, 35, 'Ery R. '),
(158, 'Menyenangkan menginap dsini, sarapannya lumayan banyak variasi tapi ada beberapa item yang tidak di refil setelah habis, jadi harus pagi-pagi sarapan jika mau dapat menu yang lengkap. Overall semuanya ok. Dekat dengan stasiun jadi aksesnya mudah. ', 8.5, 36, 'Rita W. '),
(159, 'Kebersihan terjaga, kenyamanan memadai, pelayanan cukup, makanan cukup, lokasi strategis', 9.4, 36, 'Ripno R. '),
(160, 'Nyaman hotelnya bikin tidur nyenyak.', 9.0, 36, 'Zulfyani T. R. '),
(161, 'Tempatnya bagus, pelayanannya juga sangat baik, para staff ramah dan cepat jika dimintai bantuan. Sarapannya juga enak, makanannya beragam.', 8.5, 36, 'Sri A. W. '),
(162, 'Kamar bersih walaupun kamarnya kecil dan makanan enak, ramah-ramah. ', 8.5, 36, 'Alsan A. '),
(163, 'Ruangan agak gelap dan kurang bersih. Untuk sarapan kurang enak', 5.8, 37, 'Nia N. '),
(164, 'Hotel bersih dan nyaman, sebelah Krisna oleh-oleh, hanya saja agak jauh ke sentra makanan halal untuk muslim.', 8.5, 37, 'Sujito S. '),
(165, 'Memuaskan dengan harga yang ditawarkan.', 9.7, 37, 'Nur H. '),
(166, 'Kamar sangat luas dan romantis, lokasi si samping pusat souvenir Bali, Krisna.', 9.7, 37, 'Wagimin H. '),
(167, 'Nyaman untuk istirahat dengan akses yang mudah. ', 8.5, 37, 'Riesta Y. '),
(168, 'Lokasi hotel strategis. Pelayanan ok banget, room ok, makanan ok, saya sangat puas. Kalau ke Bali lagi saya pasti ke hotek ini lagi.', 10.0, 38, 'M R. P. '),
(169, 'Lokasi strategis, hotelnya nyaman karena saya liburan bersama anak.', 9.1, 38, 'Okki R. '),
(170, 'Pelayanan baik, makanan perlu ditingktkan kualitas, serta kebersihan ruang makan perlu dijaga.', 8.5, 38, 'Bintang B. '),
(171, 'Bersih, pelayanan memuaskan, terima kasih horison.', 9.7, 38, 'Dita P. '),
(172, 'Hotelnya bagus, pelayanan ramah, strategis, tapi breakfast rasanya kurang dan macamnya sedikit, pemilihan menu juga kurang variasi.', 8.4, 38, 'Rafael B. R. '),
(173, 'Pelayanan cukup bagus dan ramah.', 8.5, 39, 'Yolla W. '),
(174, 'Cukup memuaskan cuma untuk kolam renang lebih disediakan handuk agar tamu tidak basah2an ketika kembali ke kamar.', 8.7, 39, 'Bagus B. '),
(175, 'Nyaman. Pelayanan bagus, bikin betah di kamar hotel.', 10.0, 39, 'Nurul N. '),
(176, 'Kamarnya sempit meskipun sudah kamar deluxe, breakfast kurang variatif. Kelebihannya dekat dgn pantai kuta.', 6.1, 39, 'Dede D. '),
(177, 'Lokasinya strategis, kamarnya juga nyaman...', 8.8, 39, 'Sulistyowati S. '),
(178, 'Pertama untuk review adalah proses check in sangat cepat dan lancar, kami di antar ke kamar dengan petugas yang sangat baik dan kebetulan kami mendapat kamar yang view nya bagus. Untuk kamar, kamarnya luas kamar mandinya nyaman dan wangi. Internet wifi yang sangat mendukung. Restauran yang makananan nya super enak, dan untuk breakfast banyak sekali varian nya. Ke pantai hanya tinggal jalan kaki jadi dan tidak jauh. Salah satu hotel yang Sangat saya recommend untuk liburan di bali. Thanks.', 10.0, 40, 'Resti I. '),
(179, 'Semua baik, terkecuali kasur yang saya pesan tidak sesuai dan kasur dan bantal ada bau kurang enak', 8.2, 40, 'Tjong M. F. '),
(180, 'Waktu cek innya lama nunggu. Selebihnya memuaskan', 9.7, 40, 'Isna K. '),
(181, 'So happy, kamar oke, harga terjangkau, fasilitas oke, & ada yoga di pagi hari, I love it all in this hotel.', 10.0, 40, 'Risa Y. '),
(182, 'Nice place to stay. Semuanya nyaman dan pelayanan mengagumkan.', 9.7, 40, 'Mochamad M. T. '),
(183, 'sangat recommended , jika anda ke bali wajib menginap di sini', 10.0, 41, 'Jumardi J. '),
(184, 'Luar biasa bagusnya dan indah ... kamar memuaskan , makanan memuaskan sayang CJs Bar Sepi dibanding Jkt, secara keseluruhan saya akan kembali menginap d situ', 10.0, 41, 'Emri W. '),
(185, 'Saya suka view dan suasana di hotel', 9.4, 41, 'Edi E. '),
(186, 'Hotel, pegawai, makanan semua baik, ada masalah dengan toilet yang bau pesing, dan showernya ngak bisa air dingin - hanya bisa panas. ', 6.3, 41, 'Jemmy N. '),
(187, 'Closet rusak, pindah kamar lama', 6.4, 41, 'Johanes J. '),
(188, 'Pelayanan bagus dan dekat dengan pusat perbelanjaan. ', 10.0, 42, 'Agus N. '),
(189, 'Liburan romantis di Ramada bintang bali resort, kamarnya nyaman banget. bikin suasana makin romantis. sarapan yang disajiin banyak pilihan, pelayanan pun ramah, next time pengen berkunjung lagi jadinya.', 9.7, 42, 'Yayu S. N. '),
(190, 'Tempatnya nyaman sekali dan romantis saya selalu menginap di hotel ramada .saya dan suami sangat suka sekali .hingga ke india saya pun menginap di ramada goa. Love ramada hotel .', 10.0, 42, 'Mianis M. '),
(191, 'Lokasi bagus makanan kurang banyak variasi kapan-kapan kesini lagi', 9.4, 42, 'Fahmi K. Z. '),
(192, 'Lokasi hotelnya strategis. Dekat kemana mana.... tempat yang ok untuk liburan keluarga...', 9.1, 42, 'Budhy B. '),
(193, 'Kolam renangnya bagus tapi sayang di kamar mandinya ada kecoa. ', 8.5, 43, 'Ramawulan H. '),
(194, 'Sangat bagus, akan kembali jika ke Bali', 8.5, 43, 'Adrian F. '),
(195, 'Memuaskan untuk semuanya. ', 10.0, 43, 'Bintang O. '),
(196, 'Good place and comfortable, pokoknya mantap.', 9.4, 43, 'Eko A. W. '),
(197, 'Kamar bagus bersih, sarapan enak dan juga dekat mau kemanapun', 8.5, 43, 'Dhanar S. F. '),
(198, 'Hotel budget tetapi sarung bantal agak bau dan kulit jadi bentol2, yang lain sudah oke, rooftopnya bagus.', 8.7, 44, 'Frieda Y. '),
(199, 'Tempatnya nyaman, bersih, pelayanannya ok', 10.0, 44, 'Yohanes D. '),
(200, 'Pengalaman menginap yang baik untuk budget travel. AC, kasur, air semua dalam keadaan baik. Hanya sedikit suara bising dari pintu yang tidak kedap tapi overall ok', 8.8, 44, 'Meike A. '),
(201, 'Tempatnya bersih, pelayannya ramah, namun tempat parkir mobilnya terbatas.', 8.5, 44, 'Candra H. S. '),
(202, 'Pelayanan wifi dan TV kabel suka mati sendiri.', 6.3, 44, 'Fida F. '),
(203, 'Lokasi strategis tapi kamar dan makanannya kurang. Masih banyak hotel yang lebih baik dengan harga yang sama bahkan lebih murah.', 5.8, 45, 'Yulhendri S. '),
(204, 'Khusus kamar mandinya kurang nyaman dan sempit air bekas mandi tumpah kelantai ruangan kamar tidak adanya air fan dikamar mandi sehingga kalau kita mandi pake air hangat ruangan kamar mandi jadi pengap karena asap/uap dr air panas...sehingga kalau habis mandi lantai ruangan jadi becek dan licin... Kalau tidak hati-hati ditakutkan bisa kepleset /jatuh..tq', 9.3, 45, 'Harman A. '),
(205, 'Kurangnya kedap suara per kamar, sehingga sering menggangu antar pelanggan kamar lain.', 9.4, 45, 'Melisa H. '),
(206, 'Hotelnya enak banget deket kalau ke Kuta, tapi kebersihannya kurang, cleaning service nya cuma bersihin kasur, sampah tidak diambil', 9.3, 45, 'Indra I. '),
(207, 'Saya ataupun kami khususnya, tidak akan pernah menginap di edelweiss boutique hotel lagi. karena pelayanan jelek yang diberikan, pesan kamar 10, tapi kamar cuma dikasih 9 kamar, itupun sudah marah-marah besar lebih dahulu. Handling complaint yang sangat jelek sekali diberikan management hotel', 4.8, 45, 'Ade A. L. Z. '),
(208, 'Dalam menu makanan ada makanan tidak halal. ', 6.0, 46, 'Dwi Y. '),
(209, 'Lokasi dekat kemanapun. Tetapi perawatan hotel kurang bersih.', 5.8, 46, 'Aningbambang A. '),
(210, 'Hotel tua dengan banyak kekurangan. Tolong diperbaiki lagi', 7.9, 46, 'Manaruld H. '),
(211, 'Good job dan sangat memuaskan..... ', 8.5, 46, 'M A. S. L. '),
(212, 'Makanan oke..pelayanan kamar ok. Pegawai2 hotel ok. Hanya transport kamar ke lobby yang agak susah k/ jarak', 8.5, 46, 'Ummi K. '),
(213, 'Sayang sekali jauh untuk kemana-mana, overall good!', 8.8, 47, 'Ritna S. '),
(214, 'Overall semua nya oke:) kamar nyaman, tempat nya juga oke, banyak spot untuk foto2', 8.5, 47, 'Jasie J. '),
(215, 'Tempatnya sepi dan sangat bagus buat keluarga', 9.4, 47, 'Cynthia H. '),
(216, 'Over all nilainya 9. sayangnya lantai kamar d bersihkan tp malah lengket sepanjang waktu. kamar mandi lantainya sejajar dgn kamar dan pembuangan airnya kurang bagus jd kalau mandi banjir sampai msk kamar.beach club oke banget.recommended lah', 8.8, 47, 'Rudi K. '),
(217, 'Pelayanan begitu memuaskan, Very recommended hotel.', 10.0, 47, 'Percy N. '),
(218, 'Tempatnya nyaman kalau bawa keluarga dan recommended banget buat tempat liburan keluarga di daerah Legian dan dekat kemana-mana', 10.0, 48, 'Idrus I. '),
(219, 'Hotel bersih, staff ramah, ah saya bingung nulisnya. Ngga ada yang mengecewakan sama sekali. Harus balik kesini pokoknya', 9.7, 48, 'Astried B. L. '),
(220, 'Perfect, kemana-mana dekat, semua kamar ada jendelanya.', 9.4, 48, 'Novandi A. '),
(221, 'Cukup enak dan nyaman. Dan memuaskan.', 9.1, 48, 'Ahmad T. '),
(222, 'Sebetulnya hotel nyaman, cm perlengkapan mandi kurang, soal makanan average aja, overall saya senang.', 9.3, 48, 'Kurniawan A. ');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;