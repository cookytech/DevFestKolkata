import 'package:devfest_18_kolkata/model/user.dart';
import 'package:flutter/material.dart';

class UserManager extends InheritedWidget {
  final User user;
  final ValueSetter<User> newUser;

  const UserManager({
    this.user,
    this.newUser,
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static UserManager of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(UserManager) as UserManager;
  }

  @override
  bool updateShouldNotify(UserManager old) {
    return old.user.firebaseUser != user.firebaseUser;
  }
}
