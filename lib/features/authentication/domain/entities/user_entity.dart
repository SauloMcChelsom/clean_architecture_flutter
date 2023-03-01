class UserEntity {
  final String name;
  final String email;
  final String password;
  final int id;
  final String uid;
  final String providers;
  final String last_login;
  final bool is_active;
  final String updated_at;
  final String timestamp;
  final String role;

  UserEntity(
      {this.name = '',
      this.email = '',
      this.password = '',
      this.id = 0,
      this.uid = '',
      this.providers = 'local.com',
      this.last_login = '',
      this.is_active = false,
      this.updated_at = '',
      this.timestamp = '',
      this.role = 'user'});

  bool passwordMinLength() {
    if (password.length >= 8) {
      return true;
    } else {
      return false;
    }
  }

  bool passwordMaxLength() {
    if (password.length <= 12) {
      return true;
    } else {
      return false;
    }
  }
}
