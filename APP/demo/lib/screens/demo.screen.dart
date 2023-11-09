import 'package:demo/models/demo.model.dart';
import 'package:demo/services/demo.service.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
// import 'package:fluttertoast/fluttertoast.dart';
class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  late Future<List<Demo>> futureDemo;
  // void _ingresarItemLista(String qcodigo) {
  //   setState(() {
      
  //   });
  // }

  final List<Demo> listaTemporal = [
    Demo(id: 1, modelo: 'modelo 1', qcodigo: '0000000001'),
    Demo(id: 2, modelo: 'modelo 2', qcodigo: '0000000002'),
    Demo(id: 3, modelo: 'modelo 3', qcodigo: '0000000003'),
    Demo(id: 4, modelo: 'modelo 4', qcodigo: '0000000004'),
    Demo(id: 5, modelo: 'modelo 5', qcodigo: '0000000005'),
    Demo(id: 6, modelo: 'modelo 6', qcodigo: '0000000006'),
    Demo(id: 7, modelo: 'modelo 7', qcodigo: '0000000007'),
    Demo(id: 8, modelo: 'modelo 8', qcodigo: '0000000008'),
    Demo(id: 9, modelo: 'modelo 9', qcodigo: '0000000009'),
    Demo(id: 10, modelo: 'modelo 10', qcodigo: '0000000010'),
  ];

  @override
  void initState() {
    super.initState();
    futureDemo = getDemo();
  }

  @override
  Widget build(BuildContext context) {

    final TextEditingController textEditingController = TextEditingController();

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
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: 'Escanea el código',
              ),
              onChanged: (qcodigo) {
                print(qcodigo);
                if(qcodigo.length ==10){
                  
                  final id = listaTemporal.length +1 ;
                  final Demo tmp = Demo(id: id, modelo: 'modelo $id', qcodigo: qcodigo);
                  setState(() {
                    listaTemporal.add(tmp);
                    
                  });

                  // Fluttertoast.showToast(
                  //     msg: "This is Center Short Toast",
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.CENTER,
                  //     timeInSecForIosWeb: 1,
                  //     backgroundColor: Colors.red,
                  //     textColor: Colors.white,
                  //     fontSize: 16.0
                  // );
                  //listaTemporal.add(Demo(id: id, modelo: 'modelo $id', qcodigo: qcodigo));
                  //ToastContext.init(context);
                  try {
                    ToastContext().init(context);
                    //Toast.show("${tmp.modelo} - ${tmp.qcodigo} ingresado", duration: Toast.lengthLong, gravity:  Toast.bottom);
                  } catch (e) {
                    
                  }
                   
                  textEditingController.clear();
                  print('10 caracteres - lista: ${listaTemporal.length}');
                  
                }
              },
            ),
          ),
          //
          Expanded(
            child: ListView.builder(
              itemCount: listaTemporal.length, // Cantidad de elementos en la lista
              itemBuilder: (context, index) {
                return  ListTile(
                  leading: CircleAvatar(child: Text('$index')),
                  title: Text(listaTemporal[index].modelo), //Text(listaTemporal[listaTemporal.length - (index+1)].modelo),
                  subtitle: Text(listaTemporal[index].qcodigo),//Text(listaTemporal[listaTemporal.length - (index+1)].qcodigo),
                  trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                );
              
              },
            ),
          ),
          
        ],
      ),
    ); //Placeholder();
  }
}

/*

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