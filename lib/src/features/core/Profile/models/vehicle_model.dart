class VehicleModel{
  final String vehicleType;
  final String vehicleName;
  final String vehicleRegNumber;

  static List<String> vehicleTypes = [
    'Hatchback',
    'Sports Car',
  ];

  VehicleModel({
    required this.vehicleType,
    required this.vehicleName,
    required this.vehicleRegNumber,
  });

  toJson(){
    return {
      "VehicleType": vehicleType,
      "VehicleName": vehicleName,
      "VehicleRegNumber": vehicleRegNumber,
    };
  }
}