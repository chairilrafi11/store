class CoreVariable {

  //? Global Attributte
  static const bool debug = true;
  static const bool production = false;

  //? Config API
  static const String appsVersionAndroid = "v1.0.0";
  static const String appsversionIos = "v1.0.0";
  static const String urlStagging = "http://dev.pitjarus.co/api/sariroti_md/index.php/";
  static const String urlProduction = "";

  static const String appsOrigin = "Customer";
  static const String cacheControl = "no-cache";
  static const String contentType = "application/json";

  static const Duration timeRequestApi = Duration(minutes: 1);
  static const int countdownVerification = 120; //? Second

}
