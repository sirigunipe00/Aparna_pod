import 'package:aparna_pod/core/di/injector.dart';

final _reqisteredUrl = $sl.get<Urls>(instanceName: 'baseUrl');

class Urls {
  factory Urls.aparnaUAT() => const Urls('http://192.168.1.149:8002/api');
  factory Urls.local() =>
      const Urls('https://unroused-wade-genically.ngrok-free.dev');
  // factory Urls.local() => const Urls('http://192.168.1.114:8002/api');
  factory Urls.aparnaLive() => const Urls('http://183.82.45.54/api');

  const Urls(this.url);

  final String url;

  static bool get isTest => Uri.parse(_reqisteredUrl.url)
      .authority
      .split('.')
      .first
      .toLowerCase()
      .contains('uat');

  static final baseUrl = _reqisteredUrl.url;
  static final jsonWs = '$baseUrl/resource';
  static final cusWs = '$baseUrl/method';

  static final appUpdate = '$cusWs/easy_common.api.get_app_version';

  static final getUsers = '$cusWs/aparna_pod.auth.user_login.custom_login';
  static final podUpload =
      '$cusWs/aparna_pod.api.pod_invoice.upload_pod_invoice';
  static final getList = '$cusWs/frappe.client.get_list';

  static String filepath(String path) {
    return '${baseUrl.replaceAll('api', '')}/${path.replaceAll('/private', '').replaceAll("///", '/')}';
  }
}
