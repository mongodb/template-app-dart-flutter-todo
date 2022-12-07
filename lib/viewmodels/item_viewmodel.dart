import 'package:realm/realm.dart';
import 'package:flutter_todo/realm/schemas.dart';

class ItemViewModel {
  final ObjectId id;
  String summary;
  bool isComplete;
  final String ownerId;
  late Item item;
  final Realm realm;

  ItemViewModel._(this.realm, this.item, this.id, this.summary, this.ownerId,
      this.isComplete);
  ItemViewModel(Realm realm, Item item)
      : this._(
            realm, item, item.id, item.summary, item.ownerId, item.isComplete);

  static ItemViewModel create(Realm realm, Item item) {
    final itemInRealm = realm.write<Item>(() => realm.add<Item>(item));
    return ItemViewModel(realm, item);
  }

  void delete() {
    realm.write(() => realm.delete(item));
  }

  void update({String? summary, bool? isComplete}) {
    realm.write(() {
      if (summary != null) {
        summary = summary;
        item.summary = summary as String;
      }
      if (isComplete != null) {
        isComplete = isComplete;
        item.isComplete = isComplete as bool;
      }
    });
  }
}
