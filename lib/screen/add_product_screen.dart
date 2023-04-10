import 'package:crudwithapiassignment/data/networkapiservice.dart';
import 'package:crudwithapiassignment/model/productmodel.dart';
import 'package:crudwithapiassignment/res/app_url.dart';
import 'package:flutter/material.dart';

class AddProdcutScreen extends StatefulWidget {
  AddProdcutScreen({Key? key, }) : super(key: key);

  @override
  State<AddProdcutScreen> createState() => _AddProdcutScreenState();
}

class _AddProdcutScreenState extends State<AddProdcutScreen> {

  final _form = GlobalKey<FormState>();
  bool loading = false;

  TextEditingController productNameController = TextEditingController();
  TextEditingController productCodeController = TextEditingController();
  TextEditingController productImageController = TextEditingController();
  TextEditingController productUnitPriceController = TextEditingController();
  TextEditingController productQtyController = TextEditingController();
  TextEditingController productTotalPriceController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
                const Text("Add Product Here"),
                const SizedBox(height: 10),
                TextFormField(
                  controller: productNameController,
                  decoration: const InputDecoration(
                    hintText: "Product Name",
                    border: OutlineInputBorder(
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter Product Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: productCodeController,
                  decoration: const InputDecoration(
                    hintText: "Product Code",
                    border: OutlineInputBorder(
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter Product Code";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: productImageController,
                  decoration: const InputDecoration(
                    hintText: "Product Image",
                    border: OutlineInputBorder(
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter Product Image";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: productUnitPriceController,
                  decoration: const InputDecoration(
                    hintText: "Product Unit Price",
                    border: OutlineInputBorder(
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter Product Unit Price";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: productQtyController,
                  decoration: const InputDecoration(
                    hintText: "Product Quantity",
                    border: OutlineInputBorder(
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter Product Quantity";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: productTotalPriceController,
                  decoration: const InputDecoration(
                    hintText: "Product TotalPrice",
                    border: OutlineInputBorder(
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter Product TotalPrice";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: loading ? Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue
                    ),
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.white,),
                    ),
                  )

                      : ElevatedButton(
                        child: Text("Add product"),
                        onPressed: ()async{
                        Map data =
                        {
                          "Img":productImageController.text,
                          "ProductCode":productCodeController.text,
                          "ProductName":productNameController.text,
                          "Qty":productQtyController.text,
                          "TotalPrice":productTotalPriceController.text,
                          "UnitPrice":productUnitPriceController.text
                        };

                        if (_form.currentState!.validate()) {
                          loading = true;
                          setState(() {

                          });

                            final result = await NetworkApiService().gePostApiResponse(
                            AppUrls.createProductEndPoints, data);

                            if(result['status']== 'success'){
                               ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content:  Text("Product Added Successfully"))
                              );
                            }

                          loading = false;
                          setState(() {

                          });

                        }
                      }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
