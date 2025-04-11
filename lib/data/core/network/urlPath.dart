class UrlPath {
  static const login = "/api/auth/login";
  static const register = "/api/auth/sendUnboardedEmailOtp";
  static const verifyUnboardedEmail = "/api/auth/verify-unboarded-email";
  static const requestPassword = "/forgot-password";
  static const resendPasswordOTP = "/resend-forgot-password-otp";
  static const verifyEmail = "/api/auth/verify-email";
  static const resendOTP = "/resend-verify-email-otp";
  static const resetPassword = "/reset-password";
  static const getWallet = '/api/wallet';
  static const secureAuth = "/account/mfa/generate-secret";
  static const verifySecureCode = "/account/mfa/verify-otp";
  static const user = "/user/account/profile";
  static const changePassword = "/user/account/changePassword";
}
