import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nhonga_app/model/produto/list_produto.dart';

class Adicionar_Produto extends StatefulWidget {
  Adicionar_Produto({super.key});

     final List_Produto produtos = List_Produto();

  @override
  State<Adicionar_Produto> createState() => _Adicionar_ProdutoState();
}

class _Adicionar_ProdutoState extends State<Adicionar_Produto> {

  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }


  @override
Widget build(BuildContext context) {
   
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _image == null
                  ? TextButton(
                      onPressed: getImage,
                      child: Text('Adicionar Imagem'),
                    )
                  : Image.file(_image!),


            TextFormField(
              validator: ((value) {
                if (value!.isEmpty) {
                  return 'Nome do produto';
                } else {
                  return null;
                }
              }),
              onChanged: (value) {
               // _productProvider.getFormData(productName: value);
              },
              decoration: InputDecoration(
                labelText: 'Digite nome do produto',
                hintText: 'Digite nome do produto',
                border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
              ),
              ),
            
            SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: ((value) {
                if (value!.isEmpty) {
                  return 'Preco';
                } else {
                  return null;
                }
              }),
              onChanged: (value) {
                //_productProvider.getFormData(productPrice: double.parse(value));
              },
              decoration: InputDecoration(
                labelText: 'Preco',
                hintText: 'Digite o preco',
                border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
              ),
              ),
            
            SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: ((value) {
                if (value!.isEmpty) {
                  return 'Estado do produto';
                } else {
                  return null;
                }
              }),
              onChanged: (value) {
               // _productProvider.getFormData(quantity: int.parse(value));
              },
              decoration: InputDecoration(
                labelText: 'Estado',
                hintText: 'Digite o estado',
                border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
              ),
                
              ),
            
            SizedBox(
              height: 30,
            ),

            TextField(
              decoration: InputDecoration(
                labelText: 'Localizacao',
                hintText: 'Digite a localizacao',
                border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      
                    ),
                    
              ),
              
              ),

              
             
            


         /*   DropdownButtonFormField(
                hint: Text('Select Category'),
                items: _categoryList.map<DropdownMenuItem<String>>((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                   // _productProvider.getFormData(category: value);
                  });
                }), */
            SizedBox(
              height: 30,
            ),


          ElevatedButton(
            onPressed: () {
              setState(() {
               // addedToCart = !addedToCart;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:Color.fromARGB(255, 71, 194, 167),
            ),
            child: Text(
              'Adicionar',
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 5,
              ),
            ),
          ),



          
          
          ],
        ),
      ),
    ));
  }
}
