
void main(List<String> args) {

  
  String isString = "String"; 
  print(isString);

  
  int isInteger = 17;
  print(isInteger);

  
  num isNumber = 99.5;
  print(isNumber);

  
  double isDouble = 0.25;
  print(isDouble);

  //Dynamic (Bisa Mereplace/mengganti valuenya dengan value tipe apapun)
  dynamic isDynamic = 85;
  isDynamic = "Delapan puluh lima";
  print(isDynamic);

  
  bool isBoolean = true;
  print(!isBoolean);

  
  const nama = 'Harvian';
  final isRunes = nama.runes.toList();
  print(isRunes);


  Symbol isSymbol=new Symbol(" Simbol");
  print(isSymbol);
  print(#Fathan);

  
  String? isNull; //
  print("$isNull");

}