class HospitalModel {
  final String id;
  final String name;
  final String type;
  final String address;
  final String city;
  final String postalCode;
  final String phoneNumber;
  final String website;
  final String email;

  HospitalModel({
    required this.id,
    required this.name,
    required this.type,
    required this.address,
    required this.city,
    required this.postalCode,
    required this.phoneNumber,
    required this.website,
    required this.email,
  });

  factory HospitalModel.fromJSON(Map<String, dynamic> json) {
    return HospitalModel(
      id: json['kode_rumah_sakit'],
      name: json['nama_rumah_sakit'],
      type: json['jenis_rumah_sakit'],
      address:
          '${json['alamat_rumah_sakit'] == '' ? '' : json['alamat_rumah_sakit']}, ${json['kelurahan'] == '' ? '' : json['kelurahan']}, ${json['kecamatan'] == '' ? '' : json['kecamatan']}',
      city: json['kota_administrasi'] == '' ? '' : json['kota_administrasi'],
      postalCode: json['kode_pos'] == '' ? '' : json['kode_pos'],
      phoneNumber: json['nomor_telepon'] == '' ? '' : json['nomor_telepon'],
      website: json['website'] == '' ? '' : json['website'],
      email: json['email'] == '' ? '' : json['email'],
    );
  }
}
