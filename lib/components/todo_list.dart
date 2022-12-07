import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'item_card.dart';
import 'package:flutter_todo/realm/schemas.dart';
import 'package:flutter_todo/realm/app_services.dart';
import 'package:flutter_todo/viewmodels/item_viewmodel.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final _itemViewModels = <ItemViewModel>[];
  final _myListKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<AppServices>(context).currentUser;
    final realm = Provider.of<Realm?>(context);
    if (realm == null) {
      return Container();
    }
    final stream =
        realm.query<Item>('owner_id == "${currentUser?.id}"').changes;
    return StreamBuilder<RealmResultsChanges<Item>>(
        stream: stream,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            // While we wait for data to load..
            return Container(
              padding: const EdgeInsets.only(top: 25),
              child: const Center(child: Text("No Items yet!")),
            );
          }

          final items = data.results;

          // Handle deletions. These are handles first, as indexes refer to the old collection
          for (final deletionIndex in data.deleted) {
            final toDie = _itemViewModels
                .removeAt(deletionIndex); // update view model collection
            _myListKey.currentState?.removeItem(deletionIndex,
                (context, animation) {
              return ItemCard(toDie, animation);
            });
          }

          // Handle inserts
          for (final insertionIndex in data.inserted) {
            _itemViewModels.insert(
                insertionIndex, ItemViewModel(realm, items[insertionIndex]));
            _myListKey.currentState?.insertItem(insertionIndex);
          }

          // Handle modifications
          for (final modifiedIndex in data.modified) {
            _itemViewModels[modifiedIndex] =
                ItemViewModel(realm, items[modifiedIndex]);
          }

          // Handle initialization (or any mismatch really, but that shouldn't happen)
          if (items.length != _itemViewModels.length) {
            _itemViewModels.insertAll(
                0, items.map((item) => ItemViewModel(realm, item)));
            _itemViewModels.length = items.length;
          }

          return AnimatedList(
              key: _myListKey,
              initialItemCount: items.length,
              itemBuilder: (context, index, animation) {
                return ItemCard(_itemViewModels[index], animation);
              });
        });
  }
}
