class AppUrl {
  static const String baseUrl = 'http://159.89.172.204:8009';
  static const String loginUrl = '$baseUrl/auth/authenticate';
  static const String registerUrl = '$baseUrl/auth/registerToApp';
  static const String addVegitableDetailsUrl =
      '$baseUrl/api/addVegitableWithImage';
  static const String addVegitablePicUrl = '$baseUrl/api/addVegitablePic';
  static const String addKisanDataUrl = '$baseUrl/api/addKisanData';
  static const String addDriverDetailsUrl = '$baseUrl/api/adddriverdetails';
  static const String addVendorDetailsUrl = '$baseUrl/api/addVendorData';
  static const String getDriverRecordsCount =
      '$baseUrl/api/getDriverCountByUserCode?userCode=';
  static const String getFarmerRecordsCount =
      '$baseUrl/api/getfarmerCountByUserCode?userCode=';
  static const String getVendorRecordsCount =
      '$baseUrl/api/getvendorCountByUserCode?userCode=';
  static const String getCropRecordsCount =
      '$baseUrl/api/getVegCountByUserCode?userCode=';
  static const String getAddedFarmersURL =
      '$baseUrl/api/getfarmerByUserCode?userCode=';
  static const String getAddedVegetableUrl =
      '$baseUrl/api/getVegUserCode?userCode=';
  static const String getAddedDriverUrl =
      '$baseUrl/api/getDriverByUserCode?userCode=';
  static const String getAddedVendorUrl =
      '$baseUrl/api/getAllVendorByUserCode?userCode=';

  static const String getProfileUrl = "$baseUrl/auth/profileData?userCode=";
  static const String logouturl = "$baseUrl/logoutapi";
  // update Api's

  static const String updatevegetables = '$baseUrl/api/updateVegetable';
  static const String updateDriverDetailsUrl =
      '$baseUrl/api/updateDriverDetails';
  static const String updateKisanDataUrl = '$baseUrl/api/updateKisanData';
  static const String updateVendorDetailsUrl = '$baseUrl/api/updatevendordata';
}
