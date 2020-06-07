import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class DemoExample extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => StateDemoExample();
}
class StateDemoExample extends State<DemoExample> {
  final databaseReference = Firestore.instance;
  List<String> mArrayList = [], mItemList = [];
  List<String> arrlist1 = [], arrlist2 = [];

  String dropdownValue = "loptop";
  @override
  void initState() {
    super.initState();
//    getData();
//    getDataLoaiSanPham();
  }
  void getData() async {
    databaseReference.collection("sanpham").getDocuments().then((QuerySnapshot snapshot) {
      List<String> arr = [];
      snapshot.documents.forEach((f){
        arr.add(f.data['name']);
      });
      setState(() {
        mArrayList = arr;
      });
//      print("DEVK mArrayList: "+ mArrayList[0].toString());
    });
  }
  void getDataLoaiSanPham() {
    databaseReference.collection("loaisanpham").getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f){
        if(f.data['idsanpham'] == '1'){
          arrlist1.add(f.data['name']);
        }else{
          arrlist2.add(f.data['name']);
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    print("DEVK drop: "+ dropdownValue);
    if(dropdownValue == "loptop"){
      setState(() {
        mItemList = arrlist2;
      });
    }else{
      setState(() {
        mItemList = arrlist1;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('FireStore Demo'),
      ),
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: Text('Create Record'),
                onPressed: () {
                  createRecord();
                },
              ),
//              RaisedButton(
//                child: Text('View Record'),
//                onPressed: () {
//                  getData();
//                },
//              ),
//              RaisedButton(
//                child: Text('Update Record'),
//                onPressed: () {
//                  getDataLoaiSanPham();
//                },
//              ),
//              DropdownButton<String>(
//                value: dropdownValue,
//                icon: Icon(Icons.arrow_downward),
//                iconSize: 24,
//                elevation: 16,
//                style: TextStyle(color: Colors.deepPurple),
//                underline: Container(
//                  height: 2,
//                  color: Colors.deepPurpleAccent,
//                ),
//                onChanged: (String newValue) {
//                  setState(() {
//                    dropdownValue = newValue;
//                  });
//                },
//                items: mArrayList.map<DropdownMenuItem<String>>((String value) {
//                  return DropdownMenuItem<String>(
//                    value: value,
//                    child: Text(value),
//                  );
//                }).toList(),
//              ),
//              Column(
//                children: List.generate(mItemList.length, (index){
//                  return Text(mItemList[index]);
//                }),
//              )


//              RaisedButton(
//                child: Text('Delete Record'),
//                onPressed: () {
//                  deleteData();
//                },
//              ),
            ],
          )), //center
    );
  }

  void createRecord() async {
    await databaseReference.collection("books")
        .document("1")
        .setData({
      'title': 'Mastering Flutter',
      'description': 'Programming Guide for Dart'
    });
    DocumentReference ref = await databaseReference.collection("books")
        .add({
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
    });
    print(ref.documentID);
  }

//  void getData() {
//    databaseReference.collection("sanpham").getDocuments().then((QuerySnapshot snapshot) {
//      List<String> arr = [];
//      snapshot.documents.forEach((f){
//        arr.add(f.data['name']);
//      });
//      setState(() {
//        mArrayList = arr;
//      });
//      print("DEVK mArrayList: "+ mArrayList[0].toString());
//    });
//  }

//  void getDataLoaiSanPham() {
//    databaseReference.collection("loaisanpham").getDocuments().then((QuerySnapshot snapshot) {
//      List<String> arrlist1 = [], arrlist2 = [];
//      snapshot.documents.forEach((f){
//        if(f.data['idsanpham'] == '1'){
//          arrlist1.add(f.data['name']);
//        }else{
//          arrlist2.add(f.data['name']);
//        }
//      });
//      for(var ii in arrlist1){
//        print('DEVK sanpham1: ${ii}');
//      }
//      for(var ii in arrlist2){
//        print('DEVK sanpham2: ${ii}');
//      }
//    });
//  }

//  void updateData() {
//    try {
//      databaseReference
//          .collection('books')
//          .document('1')
//          .updateData({'description': 'Head First Flutter'});
//    } catch (e) {
//      print(e.toString());
//    }
//  }
//
//  void deleteData() {
//    try {
//      databaseReference
//          .collection('books')
//          .document('1')
//          .delete();
//    } catch (e) {
//      print(e.toString());
//    }
//  }
}
