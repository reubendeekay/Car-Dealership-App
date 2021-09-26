import 'dart:io';

import 'package:flutter/material.dart';

class VehicleModel {
  final String id;
  File coverFile;
  List<File> fileImages;
  final String model;
  final String manufacturer;
  final String regNo;
  final Color color;
  final String yearOfManufacture;
  final String dateOfImport;
  final String dateOfSale;
  final String price;
  final String coverImage;
  final List<String> images;
  final String description;
  final String status;
  final String location;

  final VehicleFeatures features;

  VehicleModel(
      {this.id,
      this.model,
      this.images,
      this.manufacturer,
      this.regNo,
      this.color,
      this.yearOfManufacture,
      this.dateOfImport,
      this.dateOfSale,
      this.price,
      this.coverImage,
      this.description,
      this.status,
      this.location,
      this.fileImages,
      this.coverFile,
      this.features});
}

class VehicleFeatures {
  final String mileage;
  final String maxSpeed;
  final String numberOfSeats;
  final List<String> specialFeatures;
  final String fuelType;
  final String transmission;
  final String horsePower;

  VehicleFeatures(
      {this.mileage,
      this.maxSpeed,
      this.numberOfSeats,
      this.specialFeatures,
      this.fuelType,
      this.transmission,
      this.horsePower});

  Map<String, dynamic> toJson() {
    return {
      'mileage': mileage,
      'maxSpeed': maxSpeed,
      'numberOfSeats': numberOfSeats,
      'specialFeatures': specialFeatures,
      'fuelType': fuelType,
      'transmission': transmission,
      'horsePower': horsePower
    };
  }
}
