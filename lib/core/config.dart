final class AppConfig {
  static const appName = 'Template Basic';

  static const coreVersion = '1.4.0';
  static const privacyPolicyUrl =
      'https://github.com/dakerhel/template-basic#readme';
  static const sourceCodeUrl =
      'https://github.com/dakerhel/template-basic';

  static const updateManifestUrl = String.fromEnvironment(
    'UPDATE_MANIFEST_URL',
    defaultValue:
        'https://github.com/dakerhel/template-basic/releases/latest/download/manifest.json',
  );

  static const githubOwner = 'dakerhel';
  static const githubRepo = 'template-basic';
}
