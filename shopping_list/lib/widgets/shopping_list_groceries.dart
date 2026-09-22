import 'package:flutter/material.dart';
import 'package:shopping_list/objects/grocery.dart';

typedef ShoppingListChangedCallback = Function(Grocery grocery, bool completed);
typedef ShoppingListRemovedCallback = Function(Grocery grocery);

class ShoppingListGrocery extends StatelessWidget {
  ShoppingListGrocery(
      {required this.grocery,
      required this.completed,
      required this.onListChanged,
      required this.onDeleteGrocery})
      : super(key: ObjectKey(grocery));

  final Grocery grocery;
  final bool completed;

  final ShoppingListChangedCallback onListChanged;
  final ShoppingListRemovedCallback onDeleteGrocery;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different
    // parts of the tree can have different themes.
    // The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return completed //
        ? Colors.black54
        : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!completed) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key("LTKey" + grocery.name),
      onTap: () {
        onListChanged(grocery, completed);
        print(completed);
      },
      onLongPress: completed
          ? () {
              onDeleteGrocery(grocery);
            }
          : null,
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(grocery.abbrev()),
      ),
      title: Text(
        grocery.name + r' $' + grocery.price.toStringAsFixed(2),
        style: _getTextStyle(context),
      ),
    );
  }
}
