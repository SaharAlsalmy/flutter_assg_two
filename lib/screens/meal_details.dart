import 'package:flutter/material.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({super.key});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4"];
  Set<String> selectedItems = Set<String>();
  double mealPrice = 21.0;
  int selectedId = 0;
  int extrasPrice = 0;

  // List items = [];
  bool isCheked = false;
  updatePrice(int newPrice, int index) {
    mealPrice = mealPrice + newPrice;
    selectedId = index;
    setState(() {});
  }

  bool checkedValue = false;
  int quantity = 1;
  void incrementQuantity() {
    if (quantity < 10) {
      quantity++;
    }
    setState(() {});
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  "https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "بيتزا بالخضار ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                    Text(
                      "بيتزا بالخضار مميزة",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(mealPrice.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        Spacer(),
                        Container(
                          width: 140,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          clipBehavior: Clip.antiAlias,
                          margin: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    decrementQuantity();
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.green,
                                  )),
                              Spacer(),
                              Text(quantity.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    incrementQuantity();
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.green,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 5,
                color: Colors.grey.shade300,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ": أختيارك من الحجم ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      "أختر من القائمة",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Text("صنف ${index + 1}",
                                    style: TextStyle(fontSize: 20)),
                                Spacer(),
                                Radio(
                                    value: index,
                                    groupValue: selectedId,
                                    onChanged: (v) {
                                      v = index;
                                      selectedId = v;
                                      setState(() {});
                                    })
                              ],
                            ),
                            Divider(
                              thickness: 2,
                              color: Colors.grey.shade300,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 5,
                color: Colors.grey.shade300,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ": أختيارك من الاضافات  ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      "أختر من القائمة",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Text("صنف ${index + 1}",
                                    style: TextStyle(fontSize: 20)),
                                Spacer(),
                                Checkbox(
                                  // title: Text(items[index]),
                                  value: selectedItems.contains(items[index]),
                                  onChanged: (value) {
                                    setState(() {
                                      if (value!) {
                                        selectedItems.add(items[index]);
                                      } else {
                                        selectedItems.remove(items[index]);
                                      }
                                    }
                                    );
                                    }),
                                    
                              ],
                            ),
                            Divider(
                              thickness: 2,
                              color: Colors.grey.shade300,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(18),
                  padding: EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    children: [
                      Text(
                        "أضافة للسلة",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      Spacer(),
                      Text(mealPrice.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
