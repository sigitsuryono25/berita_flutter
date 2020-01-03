class DetailResponse {
  Data data;
  String message;
  int error;

  DetailResponse({this.data, this.message, this.error});

  DetailResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    data['error'] = this.error;
    return data;
  }
}

class Data {
  String idNews;
  String jdlNews;
  String idKelas;
  String idKategori;
  String fotoNews;
  String ketNews;
  String judulSeo;
  String postOn;
  String namaKategori;
  String kategoriSeo;
  String aktif;
  String limitHalaman;

  Data(
      {this.idNews,
      this.jdlNews,
      this.idKelas,
      this.idKategori,
      this.fotoNews,
      this.ketNews,
      this.judulSeo,
      this.postOn,
      this.namaKategori,
      this.kategoriSeo,
      this.aktif,
      this.limitHalaman});

  Data.fromJson(Map<String, dynamic> json) {
    idNews = json['id_news'];
    jdlNews = json['jdl_news'];
    idKelas = json['id_kelas'];
    idKategori = json['id_kategori'];
    fotoNews = json['foto_news'];
    ketNews = json['ket_news'];
    judulSeo = json['judul_seo'];
    postOn = json['post_on'];
    namaKategori = json['nama_kategori'];
    kategoriSeo = json['kategori_seo'];
    aktif = json['aktif'];
    limitHalaman = json['limit_halaman'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_news'] = this.idNews;
    data['jdl_news'] = this.jdlNews;
    data['id_kelas'] = this.idKelas;
    data['id_kategori'] = this.idKategori;
    data['foto_news'] = this.fotoNews;
    data['ket_news'] = this.ketNews;
    data['judul_seo'] = this.judulSeo;
    data['post_on'] = this.postOn;
    data['nama_kategori'] = this.namaKategori;
    data['kategori_seo'] = this.kategoriSeo;
    data['aktif'] = this.aktif;
    data['limit_halaman'] = this.limitHalaman;
    return data;
  }
}
