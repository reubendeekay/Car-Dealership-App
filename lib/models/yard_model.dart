import 'package:vehicle_management/models/transcation_model.dart';

class YardModel {
  final String name;
  final String image;
  final VehicleLocation location;
  final String manager;
  final List<String> availableCarIds;
  final List<String> employeeIds;
  final List<String> transactionIds;

  YardModel(
      {this.name,
      this.image,
      this.location,
      this.manager,
      this.availableCarIds,
      this.employeeIds,
      this.transactionIds});
}

class VehicleLocation {
  final double latitude;
  final double longitude;

  const VehicleLocation({
    this.latitude,
    this.longitude,
  });
}
