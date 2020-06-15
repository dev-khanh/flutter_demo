import 'package:flutter/material.dart';
import 'dart:async';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}
class _MyAppState extends State<MyApp> {
  String _debugLabelString = "";
  bool _enableConsentButton = false;
  bool _requireConsent = true;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }
  Future<void> initPlatformState() async {
    if (!mounted) return;
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setRequiresUserPrivacyConsent(_requireConsent);
    var settings = {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.promptBeforeOpeningPushUrl: true
    };
    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      this.setState(() {
        _debugLabelString =
            "Received notification: \n${notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      this.setState(() {
        _debugLabelString =
            "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });
    OneSignal.shared.setInAppMessageClickedHandler((OSInAppMessageAction action) {
      this.setState(() {
        _debugLabelString = "In App Message Clicked: \n${action.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });
    OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      print("DEVK SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
    });
    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      print("DEVK PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
    });
    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges changes) {
      print("DEVK EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
    });
    await OneSignal.shared.init("19ba670a-8e33-4d70-b87e-496b0fce4fd1", iOSSettings: settings);
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
    bool requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();
    this.setState(() {
      _enableConsentButton = requiresConsent;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: _enableConsentButton
                      ? () {
                    _handleConsent();
                  }
                      : null,
                  child: Text("Connect"),
                ),
                RaisedButton(
                  onPressed: !_enableConsentButton
                      ? () {
                    _disconect();
                  }
                      : null,
                  child: Text("Disconect"),
                ),
                RaisedButton(
                  onPressed: !_enableConsentButton
                      ? () {
                    _conect();
                  }
                      : null,
                  child: Text("Connect"),
                ),
                RaisedButton(
                  onPressed: !_enableConsentButton
                      ? () {
                          _handleSendNotification();
                        }
                      : null,
                  child: Text("Send"),
                ),
                Container(
                  child: new Text(_debugLabelString),
                  alignment: Alignment.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _handleConsent() {
    OneSignal.shared.consentGranted(true);
    print("DEVK Setting state");
    this.setState(() {
      _enableConsentButton = false;
    });
  }
  void _disconect(){
    OneSignal.shared.setSubscription(false);
    print("DEVK dissssss");
  }
  void _conect(){
    OneSignal.shared.setSubscription(true);
    print("DEVK connect");
  }
  void _handleSendNotification() async {
    var status = await OneSignal.shared.getPermissionSubscriptionState();
    var playerId = status.subscriptionStatus.userId;
    var imgUrlString = "http://cdn1-www.dogtime.com/assets/uploads/gallery/30-impossibly-cute-puppies/impossibly-cute-puppy-2.jpg";
    var notification = OSCreateNotification(
      playerIds: [playerId],
      content: "this is a test from OneSignal's Flutter SDK",
      heading: "Test Notification",
      iosAttachments: {"id1": imgUrlString},
      bigPicture: imgUrlString,
      buttons: [
        OSActionButton(text: "test1", id: "id1"),
        OSActionButton(text: "test2", id: "id2")
      ],
    );
    var response = await OneSignal.shared.postNotification(notification);
    this.setState(() {
      _debugLabelString = "Sent notification with response: $response";
    });
  }
}
