import 'package:devfest_18_kolkata/screens/invitiation_detail_screen/invitation_screen.dart';
import 'package:devfest_18_kolkata/screens/invitiation_detail_screen/login_screen.dart';
import 'package:devfest_18_kolkata/screens/invitiation_detail_screen/rejection_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:devfest_18_kolkata/helper/widgets/user_manager.dart';
import 'package:devfest_18_kolkata/model/invitation.dart';
import 'package:flutter/material.dart';

class InvitationDetailScreen extends StatefulWidget {
  @override
  _InvitationDetailScreenState createState() => _InvitationDetailScreenState();
}

class _InvitationDetailScreenState extends State<InvitationDetailScreen> {
  bool isLoading = false;

  Invitation invitation;
  bool get isSignedIn => invitation.email != null;
  bool get isInvited => invitation.isInvited;

  UserManager userManager;

  TextEditingController emailEditingController;

  @override
  void initState() {
    super.initState();
    emailEditingController = TextEditingController();
    invitation = new Invitation();
    checkCurrentStatus();
  }

  @override
  Widget build(BuildContext context) {
    userManager = UserManager.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text('Invitations'),
        centerTitle: true,
      ),
      body:  Builder(
        builder: (BuildContext context) => isLoading
            ? LinearProgressIndicator()
            : !isSignedIn
                ? LoginScreen()
                : isInvited ? InvitationScreen() : RejectionScreen(),
      ),
    );
  }



  void checkCurrentStatus() async {
    setState(() {
      isLoading = true;
    });

    await invitation.getStatus(await SharedPreferences.getInstance());

    setState(() {
      isLoading = false;
    });
    return;
  }
}
