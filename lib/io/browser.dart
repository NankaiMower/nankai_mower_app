import 'package:mqtt5_client/mqtt5_browser_client.dart';

MqttBrowserClient get() {
 return MqttBrowserClient("","anon");
}


bool isWebSocket() {
 return true;
}