import 'package:realm/realm.dart';
import 'package:flutter_todo/realm/schemas.dart';

Realm initRealm(User currentUser) {
  Configuration config = Configuration.flexibleSync(currentUser, [Item.schema]);
  Realm realm = Realm(
    config,
  );
  final userItemSub = realm.subscriptions.findByName('getUserItems');
  if (userItemSub == null) {
    realm.subscriptions.update((mutableSubscriptions) {
      // server-side rules ensure user only downloads own items
      mutableSubscriptions.add(realm.all<Item>(), name: 'getUserItems');
    });
  }
  return realm;
}
