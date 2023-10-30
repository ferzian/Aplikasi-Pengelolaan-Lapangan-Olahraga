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

class Bayar {
  Lapangan lapangan;
  int durasiSewa;

  Bayar(this.lapangan, this.durasiSewa);

  
  int totalBayar() {
    return lapangan.hargaLapangan * durasiSewa;
  }
}

class Pelanggan {
  String nama;
  String noTelp;
  Bayar sewa;

  Pelanggan(this.nama, this.noTelp, this.sewa);

  
  void tampilkanInfo() {
    print('=' * 30);
    print('            STRUK');
    print('=' * 30);
    print("Nama Pelanggan : $nama");
    print("No. Telepon    : $noTelp");
    sewa.lapangan.hargaSewa();
    print("Durasi Sewa    : ${sewa.durasiSewa} jam");
    print("Total Bayar    : ${sewa.totalBayar()}");
    print('=' * 30);
  }
}

void Inputan(Lapangan lapangan) {
  stdout.write("Masukkan Nama : ");
  var namaPelanggan = stdin.readLineSync()!;
  stdout.write("Masukkan no. telepon : ");
  var noTelpPelanggan = stdin.readLineSync()!;
  stdout.write("Durasi Sewa : ");
  var jamSewa = int.parse(stdin.readLineSync()!);
  clearScreen();

  var sewa = Bayar(lapangan, jamSewa);
  var pelanggan = Pelanggan(namaPelanggan, noTelpPelanggan, sewa);

  
  pelanggan.tampilkanInfo();
}

void clearScreen() {
  print('\x1B[2J\x1B[H'); 
}

void main() {
  print('=' * 20);
  print('   PILIH LAPANGAN');
  print('=' * 20);
  print('1. Lapangan Indoor');
  print('2. Lapangan Outdoor');
  print('=' * 20);
  print('       OPEN');
  print('   09:00 - 21:00');
  print('=' * 20);
  String pilihLapangan = stdin.readLineSync()!.toString();
  clearScreen();
  switch (pilihLapangan) {
    case '1':
      var LI = LapanganIndoor(150000);
      Inputan(LI);
      break;
    case '2':
      var LO = LapanganOutdoor(100000);
      Inputan(LO);
      break;
      default:
  }

  
}
