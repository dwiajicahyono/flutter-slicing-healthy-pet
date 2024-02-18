import 'package:slicing_healthy_pet/models/service_model.dart';

class DoctorModel {
  String name;
  String image;
  List<String> service;
  int distance;

  DoctorModel(
      {required this.name,
      required this.image,
      required this.distance,
      required this.service});
}

var doctors = [
  DoctorModel(
      name: 'Dr. Stone',
      image: 'drstone.jpg',
      distance: 10,
      service: [Service.vaccine, Service.surgery]),
  DoctorModel(
      name: 'Dr. Vannesa',
      image: 'drvanesa.png',
      distance: 10,
      service: [Service.vaccine, Service.surgery]),
  DoctorModel(
      name: 'Dr. Dwi Aji',
      image: 'drdwi.png',
      distance: 11,
      service: [Service.vaccine, Service.surgery])
];
