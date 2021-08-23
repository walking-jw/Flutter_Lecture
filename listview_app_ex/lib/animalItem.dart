class Animal {
  late String imagePath;
  late String animalName;
  late String kind;
  late bool flyExist;

  Animal(
    {
      // required = 반드시 있어야한다. 값이 없으면 오류
      required this.animalName,
      required this.kind,
      required this.imagePath,
      required this.flyExist
    }

  );

}