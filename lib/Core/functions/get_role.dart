String getRoleFromEmail(String? email) {
  if (email != null && email.endsWith('@admin.com')) {
    return 'admin';
  } else {
    return 'user';
  }
}
