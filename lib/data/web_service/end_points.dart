class ApiEndPoints {
  static const _baseUrl = "http://events.mr-dev.tech/";
  static const _apiUrl = _baseUrl + "api/";
  static const _authUrl = _apiUrl + "auth/";
  static const loginUrl = _authUrl + "login";


  static const logoutUrl = _authUrl + "logout";

  static const categoriesUrl = _apiUrl + "categories";
  static const eventDetialsUrl = _apiUrl + "events";

  // static const subCategoriesUrl = _apiUrl + "sub-categories";
  // static const productUrl = _apiUrl + "products";
  //
  // static const homeUrl = _apiUrl + "home";
  //
  //
  // static const registerUrl = _authUrl + "register";
  // static const activateUrl = _authUrl + "activate";
  // static const logoutUrl = _authUrl + "logout";
}
