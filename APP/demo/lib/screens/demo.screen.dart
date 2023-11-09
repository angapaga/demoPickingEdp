import 'package:demo/models/demo.model.dart';
import 'package:demo/services/demo.service.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  late Future<List<Demo>> futureDemo;
  void _incrementCounter() {
    setState(() {
       
    });
  }
  @override
  void initState() {
    super.initState();
    futureDemo = getDemo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Demo'),
      ),
      body: Column(
        children: [
          // Input encima del ListView
           Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Escanea el código',
              ),
              onChanged: (texto) {
                print(texto);
              },
            ),
          ),
          //
          Expanded(
            child: ListView.builder(
              itemCount: 50, // Cantidad de elementos en la lista
              itemBuilder: (context, index) {
                return  ListTile(
                  leading: CircleAvatar(child: Text('$index')),
                  title: Text('Demo $index'),
                  subtitle: Text('00000$index'),
                  trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                );
              
              },
            ),
          ),
          // ListView
          // Expanded(
          //   child: FutureBuilder<List<Demo>>(
          //     future: futureDemo,
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const CircularProgressIndicator();
          //       } else if (snapshot.hasError) {
          //         return Text('Error: ${snapshot.error}');
          //       } else if (snapshot.hasData) {
          //         return ListView.builder(
          //           itemCount: snapshot.data!.length,
          //           itemBuilder: (context, index) {
          //             return ListTile(
          //               title: Text(snapshot.data![index].modelo),
          //             );
          //           },
          //         );
          //       }
          //       return const Text('No data found');
          //     },
          //   ),
          // ),
        ],
      ),
    ); //Placeholder();
  }
}

/*
Center(
            child: FutureBuilder<List<Demo>>(
            future: futureDemo,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].name),
                    );
                  },
                );
              }
              return const Text('No data found');
            },
          ),
          )
*/