final class AppEnvironment {
  const AppEnvironment({required this.apiBaseUrl});

  static const current = AppEnvironment(
    apiBaseUrl: String.fromEnvironment('API_BASE_URL'),
  );

  final String apiBaseUrl;

  bool get hasApiBaseUrl => apiBaseUrl.isNotEmpty;
}
