class Bahan {
  final String nama;
  dynamic banyak = "";
  String satuan;

  Bahan(this.nama, this.banyak, this.satuan);
}

class Resep {
  int id;
  String nama;
  String imageAsset;
  String description;
  int waktu;
  int porsi;
  String videoUrl;
  Map<String, List<Bahan>> bahanBahan;
  List<String> cara;
  bool metric;
  int favoriteCount;
  static int idCounter = 0;
  DateTime createdAt;

  Resep({
    required this.nama,
    required this.imageAsset,
    required this.description,
    required this.waktu,
    required this.porsi,
    required this.videoUrl,
    required this.bahanBahan,
    required this.cara,
    this.metric = true,
    this.favoriteCount = 0,
    DateTime? createdAt,
  })  : id = idCounter++,
        createdAt = createdAt ?? DateTime.now(),
        super();
}

var favList = [1, 6, 2];

var resepList = [
  Resep(
      nama: "Soto Betawi",
      imageAsset: "https://www.bango.co.id/gfx/recipes/1465194939.jpg",
      description: "Soto yang berasal dari betawi",
      waktu: 60,
      porsi: 8,
      videoUrl: "",
      bahanBahan: {
        "Bahan utama": [
          Bahan("Daging sapi", 500, "g"),
          Bahan("Babat sapi", 200, "g"),
          Bahan("Paru sapi", 200, "g"),
          Bahan("Kecap manis", 3, "sdm"),
          Bahan("Kayu manis", 3, "cm"),
        ],
        "Bumbu halus": [
          Bahan("Bawang merah", 12, "butir"),
          Bahan("Bawang putih", 6, "siung")
        ],
        "Bahan pelengkap": [Bahan("Tomat", 2, "buah")]
      },
      cara: [
        "Rebus air dan daging hingga daging matang dan empuk. Potong dadu daging 3x3 cm.",
        "Saring kaldu rebusan daging, didihkan kembali dengan daging, paru, dan babat.",
        "Panaskan minyak, tumis bumbu halus bersama pala, cengkih, kayu manis, serai, lengkuas, daun jeruk, dan daun salam hingga harum. Tuang tumisan bumbu ke air rebusan daging, aduk rata. Masak dengan api sedang hingga mendidih.",
        "Tuangkan santan, Bango Kecap Manis, garam, merica bubuk, dan gula pasir. Masak hingga matang.",
        "Susun tomat dalam mangkuk, tuangkan soto, sajikan dengan bahan pelengkap lainnya.",
      ],
      favoriteCount: 5),
  Resep(
    nama: "Sate Kambing",
    imageAsset:
        "https://i0.wp.com/resepkoki.id/wp-content/uploads/2017/04/Resep-Sate-kambing.jpg?fit=500%2C333&ssl=1",
    description:
        "Sate daging kambing Lorem ipsum dolor sit amet, consetetur labore aliquyam Lorem ipsum dolor sit amet.",
    waktu: 50,
    porsi: 5,
    videoUrl: "",
    bahanBahan: {
      "Bahan": [
        Bahan("Daging kambing potong dadu", 500, "g"),
        Bahan("Tusuk sate", 20, "buah")
      ],
      "Bumbu olesan": [
        Bahan("Bawang putih, haluskan", 2, "siung"),
        Bahan("Ketumbar halus", 0.2, "sdt"),
        Bahan("Merica halus", 0.25, "sdt"),
        Bahan("Garam", 0.25, "sdt"),
        Bahan("Kecap manis", 100, "ml"),
        Bahan("Air perasan jeruk nipis", "", "secukupnya")
      ],
      "Bahan pelengkap": [
        Bahan("Tomat", 2, "buah"),
        Bahan("Kubis iris halus", 50, "g"),
        Bahan("Cabai rawit iris", 10, "buah"),
        Bahan("Kecap manis", 5, "sdm")
      ]
    },
    cara: [
      "Tusuk daging dengan tusukan sate. Isi setiap tusukan dengan 4 potong daging. Sisihkan.",
      "Dalam wadah, campur semua bahan olesan lalu oleskan ke daging sate.",
      "Bakar sate di atas bara api sambil sesekali dioles bumbu oles. Bakar hingga berwarna kecoklatan, matang, dan harum. Angkat.",
      "Tata semua bahan pelengkap (Acar timun) dan sate di atas piring saji. Tuang kecap manis di atas sate. Siap disajikan.",
    ],
    favoriteCount: 18,
  ),
  Resep(
    nama: "Sate Ayam",
    imageAsset:
        "https://i0.wp.com/resepkoki.id/wp-content/uploads/2017/04/Resep-Sate-kambing.jpg?fit=500%2C333&ssl=1",
    description:
        "Sate daging kambing Lorem ipsum dolor sit amet, consetetur labore aliquyam Lorem ipsum dolor sit amet.",
    waktu: 50,
    porsi: 5,
    videoUrl: "",
    bahanBahan: {
      "Bahan": [
        Bahan("Daging kambing potong dadu", 500, "g"),
        Bahan("Tusuk sate", 20, "buah")
      ],
      "Bumbu olesan": [
        Bahan("Bawang putih, haluskan", 2, "siung"),
        Bahan("Ketumbar halus", 0.2, "sdt"),
        Bahan("Merica halus", 0.25, "sdt"),
        Bahan("Garam", 0.25, "sdt"),
        Bahan("Kecap manis", 100, "ml"),
        Bahan("Air perasan jeruk nipis", "", "secukupnya")
      ],
      "Bahan pelengkap": [
        Bahan("Tomat", 2, "buah"),
        Bahan("Kubis iris halus", 50, "g"),
        Bahan("Cabai rawit iris", 10, "buah"),
        Bahan("Kecap manis", 5, "sdm")
      ]
    },
    cara: [
      "Tusuk daging dengan tusukan sate. Isi setiap tusukan dengan 4 potong daging. Sisihkan.",
      "Dalam wadah, campur semua bahan olesan lalu oleskan ke daging sate.",
      "Bakar sate di atas bara api sambil sesekali dioles bumbu oles. Bakar hingga berwarna kecoklatan, matang, dan harum. Angkat.",
      "Tata semua bahan pelengkap (Acar timun) dan sate di atas piring saji. Tuang kecap manis di atas sate. Siap disajikan.",
    ],
    favoriteCount: 50,
  ),
  Resep(
    nama: "Sate Sapi",
    imageAsset:
        "https://i0.wp.com/resepkoki.id/wp-content/uploads/2017/04/Resep-Sate-kambing.jpg?fit=500%2C333&ssl=1",
    description:
        "Sate daging kambing Lorem ipsum dolor sit amet, consetetur labore aliquyam Lorem ipsum dolor sit amet.",
    waktu: 50,
    porsi: 5,
    videoUrl: "",
    bahanBahan: {
      "Bahan": [
        Bahan("Daging kambing potong dadu", 500, "g"),
        Bahan("Tusuk sate", 20, "buah")
      ],
      "Bumbu olesan": [
        Bahan("Bawang putih, haluskan", 2, "siung"),
        Bahan("Ketumbar halus", 0.2, "sdt"),
        Bahan("Merica halus", 0.25, "sdt"),
        Bahan("Garam", 0.25, "sdt"),
        Bahan("Kecap manis", 100, "ml"),
        Bahan("Air perasan jeruk nipis", "", "secukupnya")
      ],
      "Bahan pelengkap": [
        Bahan("Tomat", 2, "buah"),
        Bahan("Kubis iris halus", 50, "g"),
        Bahan("Cabai rawit iris", 10, "buah"),
        Bahan("Kecap manis", 5, "sdm")
      ]
    },
    cara: [
      "Tusuk daging dengan tusukan sate. Isi setiap tusukan dengan 4 potong daging. Sisihkan.",
      "Dalam wadah, campur semua bahan olesan lalu oleskan ke daging sate.",
      "Bakar sate di atas bara api sambil sesekali dioles bumbu oles. Bakar hingga berwarna kecoklatan, matang, dan harum. Angkat.",
      "Tata semua bahan pelengkap (Acar timun) dan sate di atas piring saji. Tuang kecap manis di atas sate. Siap disajikan.",
    ],
    favoriteCount: 100,
  ),
  Resep(
    nama: "Sate Kuda",
    imageAsset:
        "https://i0.wp.com/resepkoki.id/wp-content/uploads/2017/04/Resep-Sate-kambing.jpg?fit=500%2C333&ssl=1",
    description:
        "Sate daging kambing Lorem ipsum dolor sit amet, consetetur labore aliquyam Lorem ipsum dolor sit amet.",
    waktu: 50,
    porsi: 5,
    videoUrl: "",
    bahanBahan: {
      "Bahan": [
        Bahan("Daging kambing potong dadu", 500, "g"),
        Bahan("Tusuk sate", 20, "buah")
      ],
      "Bumbu olesan": [
        Bahan("Bawang putih, haluskan", 2, "siung"),
        Bahan("Ketumbar halus", 0.2, "sdt"),
        Bahan("Merica halus", 0.25, "sdt"),
        Bahan("Garam", 0.25, "sdt"),
        Bahan("Kecap manis", 100, "ml"),
        Bahan("Air perasan jeruk nipis", "", "secukupnya")
      ],
      "Bahan pelengkap": [
        Bahan("Tomat", 2, "buah"),
        Bahan("Kubis iris halus", 50, "g"),
        Bahan("Cabai rawit iris", 10, "buah"),
        Bahan("Kecap manis", 5, "sdm")
      ]
    },
    cara: [
      "Tusuk daging dengan tusukan sate. Isi setiap tusukan dengan 4 potong daging. Sisihkan.",
      "Dalam wadah, campur semua bahan olesan lalu oleskan ke daging sate.",
      "Bakar sate di atas bara api sambil sesekali dioles bumbu oles. Bakar hingga berwarna kecoklatan, matang, dan harum. Angkat.",
      "Tata semua bahan pelengkap (Acar timun) dan sate di atas piring saji. Tuang kecap manis di atas sate. Siap disajikan.",
    ],
    favoriteCount: 1,
  ),
  Resep(
    nama: "Sate Kelinci",
    imageAsset:
        "https://i0.wp.com/resepkoki.id/wp-content/uploads/2017/04/Resep-Sate-kambing.jpg?fit=500%2C333&ssl=1",
    description:
        "Sate daging kambing Lorem ipsum dolor sit amet, consetetur labore aliquyam Lorem ipsum dolor sit amet.",
    waktu: 50,
    porsi: 5,
    videoUrl: "",
    bahanBahan: {
      "Bahan": [
        Bahan("Daging kambing potong dadu", 500, "g"),
        Bahan("Tusuk sate", 20, "buah")
      ],
      "Bumbu olesan": [
        Bahan("Bawang putih, haluskan", 2, "siung"),
        Bahan("Ketumbar halus", 0.2, "sdt"),
        Bahan("Merica halus", 0.25, "sdt"),
        Bahan("Garam", 0.25, "sdt"),
        Bahan("Kecap manis", 100, "ml"),
        Bahan("Air perasan jeruk nipis", "", "secukupnya")
      ],
      "Bahan pelengkap": [
        Bahan("Tomat", 2, "buah"),
        Bahan("Kubis iris halus", 50, "g"),
        Bahan("Cabai rawit iris", 10, "buah"),
        Bahan("Kecap manis", 5, "sdm")
      ]
    },
    cara: [
      "Tusuk daging dengan tusukan sate. Isi setiap tusukan dengan 4 potong daging. Sisihkan.",
      "Dalam wadah, campur semua bahan olesan lalu oleskan ke daging sate.",
      "Bakar sate di atas bara api sambil sesekali dioles bumbu oles. Bakar hingga berwarna kecoklatan, matang, dan harum. Angkat.",
      "Tata semua bahan pelengkap (Acar timun) dan sate di atas piring saji. Tuang kecap manis di atas sate. Siap disajikan.",
    ],
    favoriteCount: 50,
  ),
  Resep(
    nama: "Soto Kambing",
    imageAsset:
        "https://i0.wp.com/resepkoki.id/wp-content/uploads/2017/04/Resep-Sate-kambing.jpg?fit=500%2C333&ssl=1",
    description:
        "Sate daging kambing Lorem ipsum dolor sit amet, consetetur labore aliquyam Lorem ipsum dolor sit amet.",
    waktu: 50,
    porsi: 5,
    videoUrl: "",
    bahanBahan: {
      "Bahan": [
        Bahan("Daging kambing potong dadu", 500, "g"),
        Bahan("Tusuk sate", 20, "buah")
      ],
      "Bumbu olesan": [
        Bahan("Bawang putih, haluskan", 2, "siung"),
        Bahan("Ketumbar halus", 0.2, "sdt"),
        Bahan("Merica halus", 0.25, "sdt"),
        Bahan("Garam", 0.25, "sdt"),
        Bahan("Kecap manis", 100, "ml"),
        Bahan("Air perasan jeruk nipis", "", "secukupnya")
      ],
      "Bahan pelengkap": [
        Bahan("Tomat", 2, "buah"),
        Bahan("Kubis iris halus", 50, "g"),
        Bahan("Cabai rawit iris", 10, "buah"),
        Bahan("Kecap manis", 5, "sdm")
      ]
    },
    cara: [
      "Tusuk daging dengan tusukan sate. Isi setiap tusukan dengan 4 potong daging. Sisihkan.",
      "Dalam wadah, campur semua bahan olesan lalu oleskan ke daging sate.",
      "Bakar sate di atas bara api sambil sesekali dioles bumbu oles. Bakar hingga berwarna kecoklatan, matang, dan harum. Angkat.",
      "Tata semua bahan pelengkap (Acar timun) dan sate di atas piring saji. Tuang kecap manis di atas sate. Siap disajikan.",
    ],
    favoriteCount: 5,
  ),
  Resep(
    nama: "Soto Ayam",
    imageAsset:
        "https://i0.wp.com/resepkoki.id/wp-content/uploads/2017/04/Resep-Sate-kambing.jpg?fit=500%2C333&ssl=1",
    description:
        "Sate daging kambing Lorem ipsum dolor sit amet, consetetur labore aliquyam Lorem ipsum dolor sit amet.",
    waktu: 50,
    porsi: 5,
    videoUrl: "",
    bahanBahan: {
      "Bahan": [
        Bahan("Daging kambing potong dadu", 500, "g"),
        Bahan("Tusuk sate", 20, "buah")
      ],
      "Bumbu olesan": [
        Bahan("Bawang putih, haluskan", 2, "siung"),
        Bahan("Ketumbar halus", 0.2, "sdt"),
        Bahan("Merica halus", 0.25, "sdt"),
        Bahan("Garam", 0.25, "sdt"),
        Bahan("Kecap manis", 100, "ml"),
        Bahan("Air perasan jeruk nipis", "", "secukupnya")
      ],
      "Bahan pelengkap": [
        Bahan("Tomat", 2, "buah"),
        Bahan("Kubis iris halus", 50, "g"),
        Bahan("Cabai rawit iris", 10, "buah"),
        Bahan("Kecap manis", 5, "sdm")
      ]
    },
    cara: [
      "Tusuk daging dengan tusukan sate. Isi setiap tusukan dengan 4 potong daging. Sisihkan.",
      "Dalam wadah, campur semua bahan olesan lalu oleskan ke daging sate.",
      "Bakar sate di atas bara api sambil sesekali dioles bumbu oles. Bakar hingga berwarna kecoklatan, matang, dan harum. Angkat.",
      "Tata semua bahan pelengkap (Acar timun) dan sate di atas piring saji. Tuang kecap manis di atas sate. Siap disajikan.",
    ],
    favoriteCount: 3,
  ),
  Resep(
    nama: "Soto Ayam",
    imageAsset:
        "https://i0.wp.com/resepkoki.id/wp-content/uploads/2017/04/Resep-Sate-kambing.jpg?fit=500%2C333&ssl=1",
    description:
        "Sate daging kambing Lorem ipsum dolor sit amet, consetetur labore aliquyam Lorem ipsum dolor sit amet.",
    waktu: 50,
    porsi: 5,
    videoUrl: "",
    bahanBahan: {
      "Bahan": [
        Bahan("Daging kambing potong dadu", 500, "g"),
        Bahan("Tusuk sate", 20, "buah")
      ],
      "Bumbu olesan": [
        Bahan("Bawang putih, haluskan", 2, "siung"),
        Bahan("Ketumbar halus", 0.2, "sdt"),
        Bahan("Merica halus", 0.25, "sdt"),
        Bahan("Garam", 0.25, "sdt"),
        Bahan("Kecap manis", 100, "ml"),
        Bahan("Air perasan jeruk nipis", "", "secukupnya")
      ],
      "Bahan pelengkap": [
        Bahan("Tomat", 2, "buah"),
        Bahan("Kubis iris halus", 50, "g"),
        Bahan("Cabai rawit iris", 10, "buah"),
        Bahan("Kecap manis", 5, "sdm")
      ]
    },
    cara: [
      "Tusuk daging dengan tusukan sate. Isi setiap tusukan dengan 4 potong daging. Sisihkan.",
      "Dalam wadah, campur semua bahan olesan lalu oleskan ke daging sate.",
      "Bakar sate di atas bara api sambil sesekali dioles bumbu oles. Bakar hingga berwarna kecoklatan, matang, dan harum. Angkat.",
      "Tata semua bahan pelengkap (Acar timun) dan sate di atas piring saji. Tuang kecap manis di atas sate. Siap disajikan.",
    ],
    favoriteCount: 3,
  ),
  Resep(
    nama: "Soto Ayam",
    imageAsset:
        "https://i0.wp.com/resepkoki.id/wp-content/uploads/2017/04/Resep-Sate-kambing.jpg?fit=500%2C333&ssl=1",
    description:
        "Sate daging kambing Lorem ipsum dolor sit amet, consetetur labore aliquyam Lorem ipsum dolor sit amet.",
    waktu: 50,
    porsi: 5,
    videoUrl: "",
    bahanBahan: {
      "Bahan": [
        Bahan("Daging kambing potong dadu", 500, "g"),
        Bahan("Tusuk sate", 20, "buah")
      ],
      "Bumbu olesan": [
        Bahan("Bawang putih, haluskan", 2, "siung"),
        Bahan("Ketumbar halus", 0.2, "sdt"),
        Bahan("Merica halus", 0.25, "sdt"),
        Bahan("Garam", 0.25, "sdt"),
        Bahan("Kecap manis", 100, "ml"),
        Bahan("Air perasan jeruk nipis", "", "secukupnya")
      ],
      "Bahan pelengkap": [
        Bahan("Tomat", 2, "buah"),
        Bahan("Kubis iris halus", 50, "g"),
        Bahan("Cabai rawit iris", 10, "buah"),
        Bahan("Kecap manis", 5, "sdm")
      ]
    },
    cara: [
      "Tusuk daging dengan tusukan sate. Isi setiap tusukan dengan 4 potong daging. Sisihkan.",
      "Dalam wadah, campur semua bahan olesan lalu oleskan ke daging sate.",
      "Bakar sate di atas bara api sambil sesekali dioles bumbu oles. Bakar hingga berwarna kecoklatan, matang, dan harum. Angkat.",
      "Tata semua bahan pelengkap (Acar timun) dan sate di atas piring saji. Tuang kecap manis di atas sate. Siap disajikan.",
    ],
    favoriteCount: 3,
  ),
  Resep(
    nama: "Soto Ayam",
    imageAsset:
        "https://i0.wp.com/resepkoki.id/wp-content/uploads/2017/04/Resep-Sate-kambing.jpg?fit=500%2C333&ssl=1",
    description:
        "Sate daging kambing Lorem ipsum dolor sit amet, consetetur labore aliquyam Lorem ipsum dolor sit amet.",
    waktu: 50,
    porsi: 5,
    videoUrl: "",
    bahanBahan: {
      "Bahan": [
        Bahan("Daging kambing potong dadu", 500, "g"),
        Bahan("Tusuk sate", 20, "buah")
      ],
      "Bumbu olesan": [
        Bahan("Bawang putih, haluskan", 2, "siung"),
        Bahan("Ketumbar halus", 0.2, "sdt"),
        Bahan("Merica halus", 0.25, "sdt"),
        Bahan("Garam", 0.25, "sdt"),
        Bahan("Kecap manis", 100, "ml"),
        Bahan("Air perasan jeruk nipis", "", "secukupnya")
      ],
      "Bahan pelengkap": [
        Bahan("Tomat", 2, "buah"),
        Bahan("Kubis iris halus", 50, "g"),
        Bahan("Cabai rawit iris", 10, "buah"),
        Bahan("Kecap manis", 5, "sdm")
      ]
    },
    cara: [
      "Tusuk daging dengan tusukan sate. Isi setiap tusukan dengan 4 potong daging. Sisihkan.",
      "Dalam wadah, campur semua bahan olesan lalu oleskan ke daging sate.",
      "Bakar sate di atas bara api sambil sesekali dioles bumbu oles. Bakar hingga berwarna kecoklatan, matang, dan harum. Angkat.",
      "Tata semua bahan pelengkap (Acar timun) dan sate di atas piring saji. Tuang kecap manis di atas sate. Siap disajikan.",
    ],
    favoriteCount: 3,
  ),
  Resep(
    nama: "Soto Ayam",
    imageAsset:
        "https://i0.wp.com/resepkoki.id/wp-content/uploads/2017/04/Resep-Sate-kambing.jpg?fit=500%2C333&ssl=1",
    description:
        "Sate daging kambing Lorem ipsum dolor sit amet, consetetur labore aliquyam Lorem ipsum dolor sit amet.",
    waktu: 50,
    porsi: 5,
    videoUrl: "",
    bahanBahan: {
      "Bahan": [
        Bahan("Daging kambing potong dadu", 500, "g"),
        Bahan("Tusuk sate", 20, "buah")
      ],
      "Bumbu olesan": [
        Bahan("Bawang putih, haluskan", 2, "siung"),
        Bahan("Ketumbar halus", 0.2, "sdt"),
        Bahan("Merica halus", 0.25, "sdt"),
        Bahan("Garam", 0.25, "sdt"),
        Bahan("Kecap manis", 100, "ml"),
        Bahan("Air perasan jeruk nipis", "", "secukupnya")
      ],
      "Bahan pelengkap": [
        Bahan("Tomat", 2, "buah"),
        Bahan("Kubis iris halus", 50, "g"),
        Bahan("Cabai rawit iris", 10, "buah"),
        Bahan("Kecap manis", 5, "sdm")
      ]
    },
    cara: [
      "Tusuk daging dengan tusukan sate. Isi setiap tusukan dengan 4 potong daging. Sisihkan.",
      "Dalam wadah, campur semua bahan olesan lalu oleskan ke daging sate.",
      "Bakar sate di atas bara api sambil sesekali dioles bumbu oles. Bakar hingga berwarna kecoklatan, matang, dan harum. Angkat.",
      "Tata semua bahan pelengkap (Acar timun) dan sate di atas piring saji. Tuang kecap manis di atas sate. Siap disajikan.",
    ],
    favoriteCount: 3,
  ),
  Resep(
    nama: "Soto Ayam",
    imageAsset:
        "https://i0.wp.com/resepkoki.id/wp-content/uploads/2017/04/Resep-Sate-kambing.jpg?fit=500%2C333&ssl=1",
    description:
        "Sate daging kambing Lorem ipsum dolor sit amet, consetetur labore aliquyam Lorem ipsum dolor sit amet.",
    waktu: 50,
    porsi: 5,
    videoUrl: "",
    bahanBahan: {
      "Bahan": [
        Bahan("Daging kambing potong dadu", 500, "g"),
        Bahan("Tusuk sate", 20, "buah")
      ],
      "Bumbu olesan": [
        Bahan("Bawang putih, haluskan", 2, "siung"),
        Bahan("Ketumbar halus", 0.2, "sdt"),
        Bahan("Merica halus", 0.25, "sdt"),
        Bahan("Garam", 0.25, "sdt"),
        Bahan("Kecap manis", 100, "ml"),
        Bahan("Air perasan jeruk nipis", "", "secukupnya")
      ],
      "Bahan pelengkap": [
        Bahan("Tomat", 2, "buah"),
        Bahan("Kubis iris halus", 50, "g"),
        Bahan("Cabai rawit iris", 10, "buah"),
        Bahan("Kecap manis", 5, "sdm")
      ]
    },
    cara: [
      "Tusuk daging dengan tusukan sate. Isi setiap tusukan dengan 4 potong daging. Sisihkan.",
      "Dalam wadah, campur semua bahan olesan lalu oleskan ke daging sate.",
      "Bakar sate di atas bara api sambil sesekali dioles bumbu oles. Bakar hingga berwarna kecoklatan, matang, dan harum. Angkat.",
      "Tata semua bahan pelengkap (Acar timun) dan sate di atas piring saji. Tuang kecap manis di atas sate. Siap disajikan.",
    ],
    favoriteCount: 3,
  ),
  Resep(
    nama: "Soto Ayam",
    imageAsset:
        "https://i0.wp.com/resepkoki.id/wp-content/uploads/2017/04/Resep-Sate-kambing.jpg?fit=500%2C333&ssl=1",
    description:
        "Sate daging kambing Lorem ipsum dolor sit amet, consetetur labore aliquyam Lorem ipsum dolor sit amet.",
    waktu: 50,
    porsi: 5,
    videoUrl: "",
    bahanBahan: {
      "Bahan": [
        Bahan("Daging kambing potong dadu", 500, "g"),
        Bahan("Tusuk sate", 20, "buah")
      ],
      "Bumbu olesan": [
        Bahan("Bawang putih, haluskan", 2, "siung"),
        Bahan("Ketumbar halus", 0.2, "sdt"),
        Bahan("Merica halus", 0.25, "sdt"),
        Bahan("Garam", 0.25, "sdt"),
        Bahan("Kecap manis", 100, "ml"),
        Bahan("Air perasan jeruk nipis", "", "secukupnya")
      ],
      "Bahan pelengkap": [
        Bahan("Tomat", 2, "buah"),
        Bahan("Kubis iris halus", 50, "g"),
        Bahan("Cabai rawit iris", 10, "buah"),
        Bahan("Kecap manis", 5, "sdm")
      ]
    },
    cara: [
      "Tusuk daging dengan tusukan sate. Isi setiap tusukan dengan 4 potong daging. Sisihkan.",
      "Dalam wadah, campur semua bahan olesan lalu oleskan ke daging sate.",
      "Bakar sate di atas bara api sambil sesekali dioles bumbu oles. Bakar hingga berwarna kecoklatan, matang, dan harum. Angkat.",
      "Tata semua bahan pelengkap (Acar timun) dan sate di atas piring saji. Tuang kecap manis di atas sate. Siap disajikan.",
    ],
    favoriteCount: 3,
  )
];
