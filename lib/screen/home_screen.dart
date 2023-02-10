import 'package:crudwithapiassignment/screen/upload_product_screen.dart';
import 'package:flutter/material.dart';

import '../data/networkapiservice.dart';
import '../model/productmodel.dart';
import '../res/app_url.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  productModel? _productModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      productListApiRequest();
    });
  }

  Future<void> productListApiRequest() async {
    final response = await NetworkApiService().getGetApiResponse(AppUrls.viewProductListEndPoints);
    print(response);
    if (response['status'] == "success") {
      setState(() {
        _productModel = productModel.fromJson(response);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        centerTitle: true,
      ),
      body: _productModel == null ? Center(
        child: CircularProgressIndicator(),
      ) :
      ListView.builder(
        itemCount: _productModel!.data!.length,
        itemBuilder: (context,index){
          var reverseList = _productModel!.data!.reversed.toList();
          final product = reverseList[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: product.image == null ? Icon(Icons.image): Image.network(product.image ?? ""),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.productName ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Price: ${product.unitPrice}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Quantity: ${product.qty}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Total: ${product.totalPrice}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                  ButtonBar(
                                    children: [
                                      IconButton(icon: Icon(Icons.edit), onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadProdcutScreen(
                                          editText: "editProduct",
                                          productIndex: "$index",
                                        )));
                                        print(index);
                                      }),
                                      IconButton(icon: Icon(Icons.delete), onPressed: ()async{
                                        final result = await NetworkApiService().getGetApiResponse(
                                            "${AppUrls.deleteProductEndPoints}/${product.sId}");

                                        if(result['status']== 'success'){
                                            productListApiRequest();

                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text("Product deleted Successfully"))
                                          );

                                        }
                                      }),
                                    ],
                                  )
                                ],
                              )

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          );
        },
      )

    ,
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: const[
            Text("Add Product"),
            Icon(Icons.add),
          ],
        ) ,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadProdcutScreen(editText: "upload",)));
        },
      ),
    );
  }
}
