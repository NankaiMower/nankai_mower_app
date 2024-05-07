import 'package:mqtt5_client/mqtt5_server_client.dart';

MqttServerClient get() {
  return MqttServerClient("","anon");
}

bool isWebSocket() {
  return false;
}