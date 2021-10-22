import 'package:firebase_riverpod/import_packages.dart/import.dart';

import 'screen/user_detailpage.dart';

void main() async {
  //ensure binding

  runApp(ProviderScope(child: (MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailPage(),
    );
  }
}
