import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_riverpod/services/auth_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final authProvider = FutureProvider<User>((ref) async{
// return ref.read(authserviceProvider).loginwithEmail(email: email, password: password);
// });

final userProvider = StateProvider<User?>((ref) => null);
