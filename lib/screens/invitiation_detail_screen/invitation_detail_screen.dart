import 'dart:convert';
import 'package:devfest_18_kolkata/helper/widgets/user_manager.dart';
import 'package:devfest_18_kolkata/screens/invitiation_detail_screen/result_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InvitationDetailScreen extends StatefulWidget {
  @override
  _InvitationDetailScreenState createState() => _InvitationDetailScreenState();
}

class _InvitationDetailScreenState extends State<InvitationDetailScreen> {
  bool isLoading = false;
  bool isInvited;
  UserManager userManager;
  TextEditingController emailEditingController;

  @override
  void initState() {
    super.initState();
    isLoading = false;
    emailEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    const singleLetterBoxWidth = 60.0;
    userManager = UserManager.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text('Invitations'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (BuildContext context) {
          return isLoading
              ? LinearProgressIndicator()
              : SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 50.0),
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Google',
                        style: Theme.of(context).textTheme.display4,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: singleLetterBoxWidth * 0.5),
                            child: SizedBox(
                              width: singleLetterBoxWidth,
                              child: Center(
                                child: Text(
                                  '?',
                                  style: Theme.of(context).textTheme.display4,
                                ),
                              ),
                            ),
                          ),
//                                Expanded(child: SizedBox(),),
                          userManager.user == null
                              ? Opacity(
                                  opacity: 0.9,
                                  child: FlatButton.icon(
                                    onPressed: () {
                                      userManager.authorize();
                                    },
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    icon: Icon(
                                      MdiIcons.google,
                                      size: 60.0,
                                    ),
                                    label: Text(
                                      'Sign In',
                                      style:
                                          Theme.of(context).textTheme.display1,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text(
                                    'Hi, ${userManager.user.displayName.split(' ')[0]}!',
                                    style: Theme.of(context)
                                        .textTheme
                                        .display3
                                        .copyWith(fontSize: 25.0),
                                  ),
                                ),
                          Expanded(
                            child: SizedBox(),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: singleLetterBoxWidth * 0.5),
                            child: SizedBox(
                              width: singleLetterBoxWidth,
                              child: Center(
                                child: Text(
                                  ':',
                                  style: Theme.of(context).textTheme.display4,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            padding:
                                const EdgeInsets.only(top: 20.0, right: 20.0),
                            child: TextField(
                              controller: emailEditingController,
                              style: Theme.of(context)
                                  .textTheme
                                  .display3
                                  .copyWith(fontSize: 25.0),
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'If not Gmail',
                                  border: OutlineInputBorder()),
                              autofocus: false,
                            ),
                          )),
                        ],
                      ),
                      Builder(
                        builder: (_) => RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90.0)),
                              color: Theme.of(context).scaffoldBackgroundColor,
                              onPressed: () {
                                fetchStatus(_);
                              },
                              elevation: 7.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 55.0),
                                child: Text(
                                  ';',
                                  style: Theme.of(_).textTheme.display4,
                                  textScaleFactor: 0.8,
                                ),
                              ),
                            ),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }

  fetchStatus(BuildContext context) async {
    var editorText = emailEditingController.text;
    String email;
    if (!isEmailAddress(editorText)) {
      if (userManager.user == null) {
        emailEditingController.clear();
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Please Sign In with Google or enter your adress if you used non-google account to sign up'),
          ),
        );
        return;
      } else {
        email = userManager.user.email;
      }
    } else {
      email = emailEditingController.text;
    }
    try {
      bool invited = await getInviteDetails(email);
      setState(() {
        isInvited = invited;
      });
    } catch (e) {
      print('CHECK STATUS ERROR: $e');
    }
    Navigator.of(context).push(ResultScreen.route(isInvited));
  }

  Future<bool> getInviteDetails(String email) async {
    String url =
        'https://xprilion.com/devfest/check.php?email=$email&auth=whr8w43f093j4fhKLN902';
    http.Response response = await http.get(url);
    Map jsonMap = json.decode(response.body);
    assert(jsonMap['status'] != null);
    int status = jsonMap['status'] ?? 0;
    return status == 1;
  }

  bool isEmailAddress(String text) {
    RegExp emailMatcher = new RegExp(
        r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
    assert(emailMatcher.hasMatch('raveeshr503@gmail.com'));
    assert(emailMatcher.hasMatch('raveeshr503@heritageit.edu.in'));
    return emailMatcher.hasMatch(text) && text.isNotEmpty;
  }
}
