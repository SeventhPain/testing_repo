class Meals {
  final String mealTime, name, imagePath, kiloCaloriesBrunt, timeTaken;
  final String preparation;
  final List ingredients;
  Meals(
      {this.mealTime,
      this.name,
      this.imagePath,
      this.kiloCaloriesBrunt,
      this.timeTaken,
      this.preparation,
      this.ingredients});
}

final meals = [
  Meals(
    mealTime: "BREAKFAST",
    name: "Fruit Granola",
    kiloCaloriesBrunt: "271",
    timeTaken: "10",
    imagePath: "assets/fruit_granola.jpg",
    ingredients: [
      "one of oen",
      "one of two",
      "one of three",
      "one of four",
    ],
    preparation:
        "    one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one ",
  ),
  Meals(
    mealTime: "DINNER",
    name: "Pesto Pasta",
    kiloCaloriesBrunt: "612",
    timeTaken: "15",
    imagePath: "assets/pesto_pasta.jpg",
    ingredients: [
      "one of oen",
      "one of two",
      "one of three",
      "one of four",
    ],
    preparation:
        "    one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one ",
  ),
  Meals(
    mealTime: "SNACK",
    name: "Keto Snack",
    kiloCaloriesBrunt: "414",
    timeTaken: "16",
    imagePath: "assets/keto_snack.jpg",
    ingredients: [
      "one of oen",
      "one of two",
      "one of three",
      "one of four",
    ],
    preparation:
        "    one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one one of seven one of eight one of nine one of ten one of one one of two one of three one of four one of five one of six one one ",
  )
];
