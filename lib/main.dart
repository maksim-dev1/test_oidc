import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_oidc/oidc_auth/presentation/bloc/oidc_auth_bloc.dart';
import 'package:test_oidc/oidc_auth/presentation/oidc_auth_provider.dart';
import 'package:test_oidc/services/oidc_auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authService = OidcAuthService();
  await authService.init();
  runApp(OidcAuthProvider(oidcAuthService: authService, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            const Text('5 = login'),
            const Text('-5 = logout'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red),
                    iconColor: WidgetStatePropertyAll(Colors.white),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_counter == -5) {
                      context.read<OidcAuthBloc>().add(
                        const OidcAuthEvent.logout(),
                      );
                    }
                    setState(() {
                      _counter--;
                    });
                  },
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                    iconColor: WidgetStatePropertyAll(Colors.white),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_counter == 5) {
                      context.read<OidcAuthBloc>().add(
                        const OidcAuthEvent.startedAuth(),
                      );
                    }
                    setState(() {
                      _counter++;
                    });
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
