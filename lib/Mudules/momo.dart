import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Momo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _StateMoMo();
}
class _StateMoMo extends State<Momo>{
  static const MethodChannel momo = MethodChannel("com.example.vietco_app/MomoPlugin");
  @override
  void initState() {
    super.initState();
    _hash();
  }
  _hash() async {
    String hash =  await momo.invokeMethod('hashRSA', <String, String>{
      'partnerRefId': 'Merchant123556666',
      'partnerTransId': '123456789',
      'amount': '10000',
      'description': 'Thanh toan momo',
    });
    print("DEVK hash KEY: "+ hash);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(onPressed: () async{
       String token =  await momo.invokeMethod('Start', <String, String>{
         'partnerRefId': 'Merchant123556666',
         'partnerTransId': '123456789',
         'amount': '10000',
         'description': 'Thanh toan momo',
       });
        print("DEVK token KEY: "+ token);
      }, child: Text("MOMO"),),
    );
  }
}
