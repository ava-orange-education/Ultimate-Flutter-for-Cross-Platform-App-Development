void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BiometricAuthenticationScreen(),
    );
  }
}

class BiometricAuthenticationScreen extends StatefulWidget {
  @override
  _BiometricAuthenticationScreenState createState() =>
      _BiometricAuthenticationScreenState();
}

class _BiometricAuthenticationScreenState
    extends State<BiometricAuthenticationScreen> {
  final LocalAuthentication localAuth = LocalAuthentication();
  String authenticationResult = '';

  Future<void> authenticateWithBiometrics() async {
    bool canCheckBiometrics = await localAuth.canCheckBiometrics;
    List<BiometricType> availableBiometrics =
        await localAuth.getAvailableBiometrics();

    if (canCheckBiometrics && availableBiometrics.isNotEmpty) {
      bool authenticated = await localAuth.authenticate(
        localizedReason: 'Authenticate to access your account',
        biometricOnly: true,
      );

      setState(() {
        if (authenticated) {
          authenticationResult = 'Biometric authentication successful!';
        } else {
          authenticationResult =
              'Biometric authentication failed or was canceled.';
        }
      });
    } else {
      setState(() {
        authenticationResult =
            'Biometrics not available or supported on this device.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biometric Authentication Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await authenticateWithBiometrics();
              },
              child: Text('Authenticate with Biometrics'),
            ),
            SizedBox(height: 20),
            Text(
              authenticationResult,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
