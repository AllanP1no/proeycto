import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador 3.0+1.01',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({Key? key}) : super(key: key);

  @override
  StatePaginaPrincipal createState() => StatePaginaPrincipal();
}

class StatePaginaPrincipal extends State<PaginaPrincipal> {
  int _contador = 0;

  void aumentar() {
    _contador++;
    setState(() {});
  }

  void disminuir() {
    if (_contador > 0) {
      _contador--;
      setState(() {});
    }
  }

  void multiplicar() {
    _contador *= 2;
    setState(() {});
  }

  void dividir() {
    if (_contador > 0) {
      _contador = (_contador ~/ 2);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador 3.0+1.01'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 167, 167, 167),
              const Color.fromARGB(255, 255, 255, 255),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_contador',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _construirBotonDeAccion(
                    icono: Icons.add,
                    color: const Color.fromARGB(255, 141, 4, 171),
                    onPressed: aumentar,
                  ),
                  _construirBotonDeAccion(
                    icono: Icons.remove,
                    color: const Color.fromARGB(255, 10, 138, 1),
                    onPressed: disminuir,
                  ),
                  _construirBotonDeAccion(
                    icono: Icons.close,
                    color: Colors.orange,
                    onPressed: multiplicar,
                  ),
                  _construirBotonDeAccion(
                    icono: Icons.percent,
                    color: Colors.teal,
                    onPressed: dividir,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _construirBotonDeAccion({
    required IconData icono,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
        shape: MaterialStateProperty.all(const CircleBorder()),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: onPressed,
      child: Icon(icono, size: 30),
    );
  }
}
