class RequestVegetable {
  int? id;
  int? idPetani;
  int? idKoperasi;
  String? kategori;
  int? harga;
  int? berat;
  int? jumlah;
  String? durasiTahan;
  String? foto;
  String? foto_url;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? description;
  Koperasi? petani;
  Koperasi? koperasi;
  List<Status>? status;
  Status? currentStatus;

  RequestVegetable({
    this.id,
    this.idPetani,
    this.idKoperasi,
    this.kategori,
    this.harga,
    this.berat,
    this.jumlah,
    this.durasiTahan,
    this.foto,
    this.foto_url,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.petani,
    this.koperasi,
    this.status,
    this.currentStatus,
  });

  RequestVegetable.formJson(Map<String, dynamic> json) {
    id = json['id'];
    idPetani = json['idPetani'];
    idKoperasi = json['idKoperasi'];
    kategori = json['kategoru'];
    harga = int.parse(json['harga']);
    berat = int.parse(json['berat']);
    jumlah = int.parse(json['jumlah']);
    durasiTahan = json['durasiTahan'];
    foto = json['foto'];
    foto_url = json['foto_url'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    description = json['description'];
    petani = Koperasi.fromJson(json['petani']);
    koperasi = Koperasi.fromJson(json['koperasi']);
    if (json['status'] != null) {
      status = <Status>[];
      for (var e in (json['status'] as List)) {
        status!.add(Status.fromJson(e));
      }
    }
    ;
    currentStatus = json['currentStatus'];
  }
}

class Status {
  int? id;
  int? idPermintaan;
  String? keterangan;
  DateTime? tglPerubahan;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Status({
    this.id,
    this.idPermintaan,
    this.keterangan,
    this.tglPerubahan,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idPermintaan = json['idPermintaan'];
    keterangan = json['keterangan'];
    tglPerubahan = json['tglPerubahan'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class Koperasi {
  int? id;
  String? nama;
  String? email;
  String? alamat;
  dynamic? foto;
  String? noHp;
  String? role;
  DateTime? createdAt;
  DateTime? updatedAt;

  Koperasi({
    this.id,
    this.nama,
    this.email,
    this.alamat,
    this.foto,
    this.noHp,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  Koperasi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    email = json['email'];
    alamat = json['alamat'];
    foto = json['foto'];
    noHp = json['noHp'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
