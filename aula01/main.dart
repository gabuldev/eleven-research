main() {
  print("Hello World");
  var response = functionA(a: 5, b: 7);
  print(response);
  var instance = MinhaPrimeiraClasse(name: "Gabul", lastName: "DEV");
  instance.printName();

//DECLARAR VARIAVEL
  var a;

// TIPOS DEFAULT
// Logica -> bool
// numbers -> num, int, double
// texto -> String
// Dados -> List, Set, Map, Stream, Function

// Bool
  bool e = false; // true,false, null

//Numbers
  late final int b;
  b = 2;

  var c = 0.0;
  num d = 0.0;

// Texto
  var f = "";

//Dados
  final g = <String>[];
  var h = <String, String>{};
  var i = <String>{};
}

//FUNÇÕES
// tipo name(){}
// tipo name() =>

int functionA({required int a, required int b}) {
  var soma = a + b;
  return soma;
}

int functionB(int a, int b) => a + b;

//CRIAR OBJETO
// class Nome{}

class MinhaPrimeiraClasse {
  String name;
  String lastName;
  MinhaPrimeiraClasse({required this.name, required this.lastName});

  printName() => print(name);
}
