final class AppConfig {
  static const appName = 'My App';

  static const coreVersion = '1.4.0';
  static const privacyPolicyUrl = 'https://example.com/privacy';
  static const sourceCodeUrl = 'https://github.com/example/my_app';

  static const updateManifestUrl = String.fromEnvironment(
    'UPDATE_MANIFEST_URL',
    defaultValue:
        'https://raw.githubusercontent.com/dakerhel/template-basic/main/updates/manifest.json',
  );

  static const githubOwner = 'dakerhel';
  static const githubRepo = 'template-basic';
}
