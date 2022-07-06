import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final todoFutureProvider = FutureProvider.autoDispose(
  (ref) => FirebaseFirestore.instance.collection('todos').get(),
);
