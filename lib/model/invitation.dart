import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Invitation {
  String email;
  int _inviteStatus;
  bool get isInvited => _inviteStatus !=null &&_inviteStatus == 1;

  Invitation();

  getStatus(SharedPreferences preferences) async {
    //get signInStatus
    email = preferences.getString('email');

    //get Invite Status
    if (email != null) {
      _inviteStatus = preferences.getInt('inviteStatus');
      if (_inviteStatus == null) {
        http.Response response = await http.get(
            'https://xprilion.com/devfest/check.php?email=$email&auth=whr8w43f093j4fhKLN902');
        Map jsonMap = json.decode(response.body);
        assert(jsonMap['status' != null]);
        _inviteStatus = jsonMap['status'] ?? 0;
      }
      if (_inviteStatus == 1) {
        preferences.setInt('inviteStatus', _inviteStatus);
      }
    }
  }
  /*
  * 1 means applied and invited
  * 2 means either not applied or not invited
  * */

  signIn(String email){

  }

//  String get code
}
