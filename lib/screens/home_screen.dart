import 'package:flutter/material.dart';
import 'package:ticket_raising_app/screens/form_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/database/bloc/database_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final CollectionReference _tickets =
  //     FirebaseFirestore.instance.collection('tickets');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HomeScreen',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FormScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: BlocBuilder<DatabaseBloc, DatabaseState>(
        builder: (context, state) {
          if (state is DatabaseInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DatabaseSuccess) {
            ListView.builder(
              itemCount: state.listofTickets.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(state.listofTickets[index].title),
                    subtitle: Text(state.listofTickets[index].description),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(state.listofTickets[index].location),
                        Text(state.listofTickets[index].date),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}




// return StreamBuilder(
//             stream: _tickets.snapshots(),
//             builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//               if (streamSnapshot.hasData) {
//                 return ListView.builder(
//                   itemCount: streamSnapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     final DocumentSnapshot documentSnapshot =
//                         streamSnapshot.data!.docs[index];
//                     return Card(
//                       child: ListTile(
//                         title: Text(documentSnapshot['title']),
//                         subtitle: Text(documentSnapshot['description']),
//                         trailing: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text(documentSnapshot['location']),
//                             Text(documentSnapshot['date']),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             },
//           );