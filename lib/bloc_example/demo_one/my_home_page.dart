// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'counter_bloc.dart';
// import 'theme_bloc.dart';
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => ThemeBloc(),
//       child: BlocBuilder<ThemeBloc, ThemeData>(
//         builder: (_, theme) {
//           return MaterialApp(
//             title: 'Flutter Demo',
//             home: BlocProvider(
//               create: (_) => CounterBloc(),
//               child: CounterPage(),
//             ),
//             theme: theme,
//           );
//         },
//       ),
//     );
//   }
// }
// class CounterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Counter')),
//       body: BlocBuilder<CounterBloc, int>(
//         builder: (_, count) {
//           return Center(
//             child: Text(
//               '$count',
//               style: const TextStyle(fontSize: 24.0),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0),
//             child: FloatingActionButton(
//               child: const Icon(Icons.add),
//               onPressed: (){
//                 context.bloc<CounterBloc>().add(CounterEvent.increment);
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0),
//             child: FloatingActionButton(
//               child: const Icon(Icons.remove),
//               onPressed: () =>
//                   context.bloc<CounterBloc>().add(CounterEvent.decrement),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0),
//             child: FloatingActionButton(
//               child: const Icon(Icons.brightness_6),
//               onPressed: () => context.bloc<ThemeBloc>().add(ThemeEvent.toggle),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0),
//             child: FloatingActionButton(
//               backgroundColor: Colors.red,
//               child: const Icon(Icons.error),
//               onPressed: () => context.bloc<CounterBloc>().add(null),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
