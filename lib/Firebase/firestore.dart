// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ethyummy/Auth%20Models/auth_class.dart';
import 'package:ethyummy/Models/Coin_later.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  final CollectionReference CryptoCollection =
      FirebaseFirestore.instance.collection('Balance');

  Future UpdateUserData(
    double balance,
    String Coinname,
    double Coinbalance,
    String id,
    double priceChange24H,
    double priceChangePercentage24H,
  ) async {
    return await CryptoCollection.doc(uid).set({
      'balance': balance,
      'id': id,
      'priceChange24H': priceChange24H,
      'priceChangePercentage24H': priceChangePercentage24H,
      'Coinname': Coinname,
      'Coinbalance': Coinbalance,
    });
  }

  List<Coins> CoinListfromsnap(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return Coins(
          currentPrice: e['balance'],
          id: e['id'],
          name: e['Coinname'],
          priceChange24H: e['Coinname'],
          priceChangePercentage24H: e['Coinname']);
    }).toList();
  }

  Coinsy UserdataFromSnapshots(DocumentSnapshot snapshot) {
    return Coinsy(
      uid: uid,
      currentPrice: snapshot['balance'],
      id: snapshot['id'],
      name: snapshot['Coinname'],
      priceChange24H: snapshot['priceChange24H'],
      priceChangePercentage24H: snapshot['priceChangePercentage24H'],
    );
  }

  Stream<List<Coins>> get crypto {
    return CryptoCollection.snapshots().map(CoinListfromsnap);
  }

  Stream<Coinsy> get coinsy {
    return CryptoCollection.doc(uid).snapshots().map(UserdataFromSnapshots);
  }
}
