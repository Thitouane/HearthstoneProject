import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:projet/data/models/card_hs.dart';

class FavoriteRepository {
  final _fireCloud = FirebaseFirestore.instance.collection("card");

  Future<List<CardHS>> get() async {
    List<CardHS> cardList = [];
    try {
      final service = await _fireCloud.get();
      service.docs.forEach((element) {
        return cardList.add(CardHS.fromJson(element.data()));
      });
      return cardList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}': ${e.message}");
      }
      return cardList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> getId(CardHS card) async {
    String id = "";
    try {
      final service = await _fireCloud
          .where("cardId", isEqualTo: card.cardId)
          .get();

      return service.docs.first.id;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}': ${e.message}");
      }
      return id;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> add(CardHS card) async {
    try {
      await _fireCloud.add(card.toJson());
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}': ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> del(CardHS card) async {
    try {
      String id = await getId(card);
      await _fireCloud.doc(id).delete();
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}': ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}