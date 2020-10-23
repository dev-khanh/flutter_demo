// import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
//
// class LoadImageCacheManager extends StatelessWidget {
//   Stream<FileResponse> fileStream;
//   String url;
//   LoadImageCacheManager({this.fileStream, this.url});
//   initDataStream(){
//     fileStream = DefaultCacheManager().getFileStream(url, withProgress: true);
//   }
//   void _clearCache() {
//     DefaultCacheManager().emptyCache();
//     fileStream = null;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(initialData: initDataStream(), stream: fileStream, builder: (context, snap){
//       Widget body;
//       var loading = !snap.hasData || snap.data is DownloadProgress;
//       if (snap.hasError) {
//         body = ListTile(
//           title: const Text('Error'),
//           subtitle: Text(snap.error.toString()),
//         );
//       } else if (loading) {
//         body = ProgressIndicator(progress: snap.data as DownloadProgress);
//       } else {
//         body = FileInfoWidget(
//           fileInfo: snap.data as FileInfo,
//         );
//       }
//       return Scaffold(
//         body: body,
//       );
//     });
//   }
// }
// class FileInfoWidget extends StatelessWidget {
//   final FileInfo fileInfo;
//   const FileInfoWidget({Key key, this.fileInfo}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     print("DEVK: " + fileInfo.originalUrl + "    -    " + fileInfo.source.toString() +  "     -    " + fileInfo.validTill.toIso8601String());
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: fileInfo.file != null ? AssetImage(fileInfo.file.path.toString()) : NetworkImage("https://www.soappresentations.com/wp-content/uploads/2014/04/What-Kind-of-Background-Should-A-Slide-Have-1024x384.png"),
//           fit: BoxFit.fill,
//         ),
//       ),
//     );
//   }
// }
// class ProgressIndicator extends StatelessWidget {
//   final DownloadProgress progress;
//   const ProgressIndicator({Key key, this.progress}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Container(
//             width: 50.0,
//             height: 50.0,
//             child: CircularProgressIndicator(
//               value: progress?.progress,
//             ),
//           ),
//           const SizedBox(width: 20.0),
//         ],
//       ),
//     );
//   }
// }