class Constants {
  static const String baseUrl = 'https://ecommerce.routemisr.com';
  static const String auth = '/api/v1/auth';
  static const String signupEndPoint = '$auth/signup';
  static const String signinEndPoint = '$auth/signin';
  static const String productEndPoint = '/api/v1/products';
  static const String cartEndPoint = '/api/v1/cart';
  static const String favoriteEndPoint = '/api/v1/wishlist';
  static const String checkoutEndPoint = '/api/v1/orders/checkout-session';
  static const String forgetPasswordEndPoint = '$auth/forgotPasswords';
  static const String verifyResetCodeEndPoint = '$auth/verifyResetCode';
  static const String resetPasswordEndPoint = '$auth/resetPassword';
  static const String verifyTokenEndPoint = '$auth/verifyToken';
}
