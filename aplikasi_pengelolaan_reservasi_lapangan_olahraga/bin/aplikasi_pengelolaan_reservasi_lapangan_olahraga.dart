import 'dart:io';

abstract class Lapangan {
  late int hargaLapangan;

  Lapangan(this.hargaLapangan);

  void hargaSewa() {
    print("Harga / Jam    : $hargaLapangan");
  }
}

class LapanganIndoor extends Lapangan {
  LapanganIndoor(int hargaLapangan) : super(hargaLapangan);
}

class LapanganOutdoor extends Lapangan {
  LapanganOutdoor(int hargaLapangan) : super(hargaLapangan);
}

class Pelanggan {
  String nama;
  String noTelp;
  Lapangan lapangan;
  int durasiSewa;

  Pelanggan(this.nama, this.noTelp, this.lapangan, this.durasiSewa);

  int totalBayar() {
    return lapangan.hargaLapangan * durasiSewa;
  }
}

void LihatDaftarPelanggan(List<Pelanggan> pelangganList) {
  if (pelangganList.isEmpty) {
    print("Tidak ada data pelanggan.");
  } else {
    print("=== Daftar Pelanggan ===");
    for (int i = 0; i < pelangganList.length; i++) {
      print("Pelanggan ke-${i + 1}:");
      print("Nama: ${pelangganList[i].nama}");
      print("No. Telepon: ${pelangganList[i].noTelp}");
      pelangganList[i].lapangan.hargaSewa();
      print("Durasi Sewa: ${pelangganList[i].durasiSewa} jam");
      print("Total Bayar: ${pelangganList[i].totalBayar()}");
      print("===");
    }
  }

  print("Tekan Enter untuk kembali ke menu utama.");
  stdin.readLineSync();
  clearScreen();
}

void Inputan(Lapangan lapangan, List<Pelanggan> pelangganList) {
  stdout.write("Masukkan Nama : ");
  var namaPelanggan = stdin.readLineSync()!;
  stdout.write("Masukkan no. telepon : ");
  var noTelpPelanggan = stdin.readLineSync()!;
  stdout.write("Durasi Sewa /JAM : ");
  var jamSewa = int.parse(stdin.readLineSync()!);
  clearScreen();

  var pelanggan = Pelanggan(namaPelanggan, noTelpPelanggan, lapangan, jamSewa);
  pelangganList.add(pelanggan); // Menambahkan pelanggan ke daftar
}

void HapusPelanggan(List<Pelanggan> pelangganList, int index) {
  if (index >= 0 && index < pelangganList.length) {
    print("Menghapus pelanggan ke-${index + 1}");
    pelangganList.removeAt(index);
  } else {
    print("Indeks tidak valid.");
  }
}

void clearScreen() {
  print('\x1B[2J\x1B[H');
}

void main() {
  var pelangganList = <Pelanggan>[]; // Daftar pelanggan
  bool selesai = false;

  while (!selesai) {
    print('=' * 20);
    print('   PILIH MENU');
    print('=' * 20);
    print('1. Pesan Lapangan');
    print('2. Lihat Daftar Pelanggan');
    print('3. Hapus Pelanggan');
    print('4. Selesai');
    print('=' * 20);
    String pilihMenu = stdin.readLineSync()!.toString();
    clearScreen();
    switch (pilihMenu) {
      case '1':
    print('=' * 20);
        print('   PILIH LAPANGAN');
    print('=' * 20);
        print('1. Lapangan Indoor');
        print('2. Lapangan Outdoor');
    print('=' * 20);
        print('');
        String pilihLapangan = stdin.readLineSync()!.toString();
        clearScreen();
        switch (pilihLapangan) {
          case '1':
            var LI = LapanganIndoor(150000);
            Inputan(LI, pelangganList);
            break;
          case '2':
            var LO = LapanganOutdoor(100000);
            Inputan(LO, pelangganList);
            break;
          default:
            print("Pilihan lapangan tidak valid.");
        }
        break;
      case '2':
        LihatDaftarPelanggan(pelangganList);
        break;
      case '3':
        stdout.write("Masukkan indeks pelanggan yang akan dihapus: ");
        var index = int.parse(stdin.readLineSync()!);
        HapusPelanggan(pelangganList, index - 1);
        break;
      case '4':
        selesai = true;
        break;
      default:
        print("Pilihan tidak valid.");
    }
  }
}
