import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce/common/widgets/custom_button.dart';
import 'package:ecommerce/common/widgets/custom_textfield.dart';
import 'package:ecommerce/constants/global_variables.dart';
import 'package:ecommerce/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = "/add-product";
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _prodductNameController = TextEditingController();
  final TextEditingController _prodductDescriptionController =
      TextEditingController();
  final TextEditingController _prodductPriceController =
      TextEditingController();
  final TextEditingController _prodductCategoryController =
      TextEditingController();
  final TextEditingController _prodductQuantityController =
      TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _prodductNameController.dispose();
    _prodductDescriptionController.dispose();
    _prodductPriceController.dispose();
    _prodductCategoryController.dispose();
    _prodductQuantityController.dispose();
  }

  List<File> images = [];

  String category = "Mobiles";
  List<String> productCategories = [
    "Mobiles",
    "Essentials",
    "Appliances",
    "Books",
    "Fashion",
  ];
  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
            child: const Text(
              "add product",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              images.isNotEmpty
                  ? CarouselSlider(
                      items: images.map((i) {
                        return Builder(
                            builder: (BuildContext context) => Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.file(
                                      i,
                                      fit: BoxFit.cover,
                                      height: 200,
                                    ),
                                  ),
                                ));
                      }).toList(),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        height: 200,
                      ),
                    )
                  : GestureDetector(
                      onTap: selectImages,
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        dashPattern: const [10, 4],
                        strokeCap: StrokeCap.round,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.folder_open_outlined,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Select Product Image "),
                            ],
                          ),
                        ),
                      ),
                    ),
              const SizedBox(height: 30),
              CustomTextfield(
                controller: _prodductNameController,
                hintText: 'Name',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                controller: _prodductDescriptionController,
                hintText: 'Description',
                maxLines: 7,
                obscureText: false,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                controller: _prodductQuantityController,
                hintText: 'Qty',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                controller: _prodductPriceController,
                hintText: 'Price',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: DropdownButton(
                  value: category,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: productCategories.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      category = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              CustomButton(text: 'Sell', onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
