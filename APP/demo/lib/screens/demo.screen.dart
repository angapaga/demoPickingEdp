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
  late Future<List<Demo>> futureDemoLista;
  late Future<List<Demo>> futureDemoStore;
  // void _ingresarItemLista(String qcodigo) {
  //   setState(() {
      
  //   });
  // }A

  final List<Demo> listaTemporal = [
    Demo(id: 1, idmovimiento: 1, cbarra: '0000000001',estado: "A"),
    Demo(id: 2, idmovimiento: 1, cbarra: '0000000002',estado: "A"),
    Demo(id: 3, idmovimiento: 1, cbarra: '0000000003',estado: "A"),
    Demo(id: 4, idmovimiento: 1, cbarra: '0000000004',estado: "A"),
    Demo(id: 5, idmovimiento: 1, cbarra: '0000000005',estado: "A"),
    Demo(id: 6, idmovimiento: 1, cbarra: '0000000006',estado: "A"),
    Demo(id: 7, idmovimiento: 1, cbarra: '0000000007',estado: "A"),
    Demo(id: 8, idmovimiento: 1, cbarra: '0000000008',estado: "A"),
    Demo(id: 9, idmovimiento: 1, cbarra: '0000000009',estado: "A"),
    Demo(id: 10, idmovimiento: 1, cbarra: '0000000010',estado: "A"),
  ];

  @override
  void initState() {
    super.initState();
    futureDemoLista = getDemo();
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
              onChanged: (cbarra) {
                print(cbarra);
                if(cbarra.length ==10){
                  
                  final id = listaTemporal.length +1 ;
                  final Demo tmp = Demo(id: id, idmovimiento: 1, cbarra: cbarra, estado: "A");
                  setState(() {
                    //listaTemporal.add(tmp);
                    futureDemoStore = storeDemo(tmp);
                    futureDemoLista = getDemo();
                  });

                  //aqui va el alert
                  
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

          Expanded(
            child: FutureBuilder<List<Demo>>(
              future: futureDemoLista,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                     return  ListTile(
                      leading: CircleAvatar(child: Text('$index')),
                      title: Text('movimiento: ${listaTemporal[index].idmovimiento}'), //Text(listaTemporal[listaTemporal.length - (index+1)].modelo),
                      subtitle: Text(listaTemporal[index].cbarra),//Text(listaTemporal[listaTemporal.length - (index+1)].qcodigo),
                      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                    );
                    },
                  );
                }
                return const Text('No data found');
              },
            ),
          ),

          //
        ],
      ),
    ); //Placeholder();
  }
}

/*

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



        // Expanded(
    //   child: ListView.builder(
    //     itemCount: listaTemporal.length, // Cantidad de elementos en la lista
    //     itemBuilder: (context, index) {
    //       return  ListTile(
    //         leading: CircleAvatar(child: Text('$index')),
    //         title: Text('movimiento: ${listaTemporal[index].idmovimiento}'), //Text(listaTemporal[listaTemporal.length - (index+1)].modelo),
    //         subtitle: Text(listaTemporal[index].cbarra),//Text(listaTemporal[listaTemporal.length - (index+1)].qcodigo),
    //         trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
    //       );
        
    //     },
    //   ),
    // ),

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