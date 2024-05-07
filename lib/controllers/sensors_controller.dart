import 'package:get/get.dart';
import 'package:nankai_mower_app/models/sensor_state.dart';

class SensorsController extends GetxController {
  final sensorStates = <String, DoubleSensorState>{}.obs;
}