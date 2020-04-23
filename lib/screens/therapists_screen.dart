import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:implulsnew/model/therapist.dart';
import 'package:implulsnew/screens/add_therapist_screen.dart';
import 'package:implulsnew/services/firestore_database_service.dart';
import 'package:implulsnew/widgets/list_items_builder.dart';
import 'package:provider/provider.dart';

class TherapistsScreen extends StatefulWidget {
  @override
  _TherapistsScreenState createState() => _TherapistsScreenState();
}

class _TherapistsScreenState extends State<TherapistsScreen> {
  @override
  Widget build(BuildContext context) {
    final database =
        Provider.of<FirestoreDatabaseService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Therapists'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTherapistScreen(),
            ),
          );
        },
      ),
      body: Container(
        child: Center(
          child: StreamBuilder<List<Therapist>>(
            stream: database.therapistsStream(),
            builder: (context, snapshot) {
              return ListItemsBuilder<Therapist>(
                snapshot: snapshot,
                itemBuilder: (context, therapist) => Dismissible(
                  key: Key('therapist-${therapist.id}'),
                  background: Container(color: Colors.red),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) => _delete(context, therapist),
                  child: Card(
                    child: ListTile(
                      onTap: () {},
                      title: Text('${therapist.firstName} ${therapist.lastName}',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _delete(BuildContext context, Therapist therapist) async {
    try {
      final database = Provider.of<FirestoreDatabaseService>(context);
      await database.deleteTherapist(therapist);
    } on PlatformException catch (e) {
      print(e);
      // PlatformExceptionAlertDialog(
      //   title: 'Operation failed',
      //   exception: e,
      // ).show(context);
    }
  }
}