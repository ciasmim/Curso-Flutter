import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Tarefas'),
          ),
          body: ListView(
            children: [
              Task('Aprender Flutter', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 2),
              Task('Clonar Nubank', 'https://logodownload.org/wp-content/uploads/2019/08/nubank-logo-2.png', 3),
              Task('Nova receita', 'https://i.pinimg.com/564x/60/58/ee/6058ee20f52d75cd95933d15e28bbcd3.jpg', 4),

            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {}),
        ));
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade , {Key? key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.cyan,
              height: 140,
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.black26,
                          width: 72,
                          height: 100,
                          child: Image.network(
                            widget.foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 200,
                                child: Text(
                                  widget.nome,
                                  style: TextStyle(
                                    fontSize: 24,
                                    overflow: TextOverflow.ellipsis, //para nao extourar o widget com frases grandes
                                  ),
                                )),
                            Row(
                              children: [
                                Icon(Icons.star, size: 15,color: (widget.dificuldade >= 1) ? Colors.blue : Colors.blue [100],),
                                Icon(Icons.star, size: 15,color: (widget.dificuldade >= 2) ? Colors.blue : Colors.blue [100],),
                                Icon(Icons.star, size: 15,color: (widget.dificuldade >= 3) ? Colors.blue : Colors.blue [100],),
                                Icon(Icons.star, size: 15,color: (widget.dificuldade >= 4) ? Colors.blue : Colors.blue [100],),
                                Icon(Icons.star, size: 15,color: (widget.dificuldade >= 5) ? Colors.blue : Colors.blue [100],),
                              ]
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });
                            print(nivel);
                          },
                          child: Icon(Icons.arrow_drop_up),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan),
                        )
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.lightGreenAccent,
                          value: nivel / 10,
                        ),
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Nivel:  $nivel',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
