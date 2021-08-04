class PickHospitalModel {
  String hospitalname;
  String hospitalId;
  int distance;
  int duration;

  PickHospitalModel({
    required this.hospitalname,
    required this.hospitalId,
    required this.distance,
    required this.duration,
  });

  factory PickHospitalModel.fromJSON(Map<String, dynamic> json) {
    return PickHospitalModel(
      hospitalname: json['result']['nama_rumah_sakit'],
      hospitalId: json['result']['kode_rumah_sakit'],
      distance: json['result']['distance'],
      duration: json['result']['duration'],
    );
  }
}
