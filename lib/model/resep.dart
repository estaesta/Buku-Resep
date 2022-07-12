class Bahan {
  final String nama;
  int banyak;
  String satuan;

  Bahan(this.nama, this.banyak, this.satuan);
}

class Resep {
  String nama;
  String imageAsset;
  String description;
  int waktu;
  int porsi;
  String videoUrl;
  List<Bahan> bahanBahan;
  List<String> cara;
  bool metric = true;

  Resep({
    required this.nama,
    required this.imageAsset,
    required this.description,
    required this.waktu,
    required this.porsi,
    required this.videoUrl,
    required this.bahanBahan,
    required this.cara,
  });
}

var resepList = [
  Resep(nama: "Soto Betawi", imageAsset: "/#", description: "Soto yang berasal dari betawi", waktu: 40, porsi: 5, videoUrl: "#", bahanBahan: [
    Bahan("Daging sapi", 2, "Kg")
  ], cara: [
    "Potong daging sapi",
    "Masak"
  ])
];
