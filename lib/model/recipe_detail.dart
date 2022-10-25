import 'package:flutter/material.dart';
import 'package:recipe/model/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            // 6
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: Text(
                        '${ingredient.quantity * _sliderVal} ${ingredient.measure} ${ingredient.name}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Text(
              'Shop Ingridients Here',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            SafeArea(
              child: Row(
                children: const <Widget>[
                  Text(
                    'Add To Cart',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.add_shopping_cart_outlined,
                      size: 50,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 9,
              label: '${_sliderVal * widget.recipe.servings} servings',
              value: _sliderVal.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
              activeColor: Colors.green,
              inactiveColor: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
