class RobotState {
  String name = "Nankai Mower";
  double wifiPercent = 100.0;
  double gpsPercent = 100.0;
  double batteryPercent = 100.0;

  String currentState = "AREA_RECORDING"; // AREA_RECORDING Unknown
  String currentSubState = "Unknown";

  bool isRunning = false;
  bool isCharging = false;
  bool isEmergency = false;
  bool isConnected = false;

  double posX = 0, posY = 0, posAccuracy = 0, heading = 0, headingAccuracy = 0;
  bool headingValid = true;
}