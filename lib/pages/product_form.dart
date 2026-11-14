import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/models/product_list.dart';
import 'package:store/models/product_list.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  State<ProductForm> createState() => _ProductForm();
}

class _ProductForm extends State<ProductForm> {
  final _priceFocus=FocusNode();
  final _descriptionFocus=FocusNode();
  final _imageUrlFocus=FocusNode();
  final _imageUrlController= TextEditingController();
  final _formKey=GlobalKey<FormState>(); //para ter acesso ao formulario chave global
  final _formData =Map<String,Object>();

  @override
  void initState(){
    super.initState();
    _imageUrlController.addListener(updateImage);
  }
  @override
  void dispose(){
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _imageUrlController.removeListener(updateImage);
    _imageUrlFocus.dispose();
  }
  void updateImage(){
    setState(() {
    });
  }

  void _submitForm(){
    final isValid = _formKey.currentState?.validate()?? false;
    if(!isValid){
      return;
    }
    _formKey.currentState?.save();//faz a chamada de cada campo onSaved
    
    Provider.of<ProductList>(context,listen: false).saveProduct(_formData);
    Navigator.of(context).pop();
  }
  @override
  void didChangeDependencies(){
    
    super.didChangeDependencies();
    if(_formData.isEmpty){
      final arg=ModalRoute.of(context)?.settings.arguments;
       
      if(arg !=null){
        final product =arg as Product;

      _formData['id']=product.id;
      _formData['name']=product.title;
      _formData['price']=product.price;
      _formData['description']=product.description;
      _formData['imageUrl']=product.imageUrl;
      _imageUrlController.text=product.imageUrl;
      }
     

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
        actions:[
          IconButton(
            onPressed: _submitForm,

          icon: Icon(Icons.save)
          ),
        ]
      ),
    
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key:_formKey,  //vincula o formulario com globalkey
          child:ListView(
            children: [
              TextFormField(
                initialValue:_formData['name']?.toString(),
                decoration: InputDecoration(
                  labelText: 'Nome'
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_priceFocus);
                },
                onSaved:(name)=>_formData['name']=name??'',
                validator:(_name){
                  final name = _name ?? '';

                  if(name.trim().isEmpty){
                    return 'Nome é obrigatorio';
                  }

                  if(name.trim().length<3){
                    return 'Nome precisa no minino 3 letras';
                  }
                  return null;
                }
              ),
              TextFormField(
                initialValue:_formData['price']?.toString(),
                decoration: InputDecoration(
                  labelText: 'Preço'
                ),
                textInputAction: TextInputAction.next,
                focusNode: _priceFocus,
                keyboardType: TextInputType.numberWithOptions(
                  decimal:true,
                ),
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_descriptionFocus);
                },
                 onSaved:(price)=>_formData['price']= double.parse(price??'0'),
                 validator: (_price){
                  final priceString = _price ?? '-1';
                  final price = double.tryParse(priceString) ?? -1;
                  if (price<=0){
                    return 'Informe um preço valido';
                  }
                  return null;
                 }
              ),
               TextFormField(
                initialValue:_formData['description']?.toString(),
                decoration: InputDecoration(
                  labelText: 'Descrição'
                ),
                focusNode: _descriptionFocus,
                textInputAction: TextInputAction.next,
               keyboardType:TextInputType.multiline,
               maxLines:3,
               onSaved:(description)=>_formData['description']=description??'',
               validator:(_description){
                  final description= _description ?? '';

                  if(description.trim().isEmpty){
                    return 'A descrição é obrigatótia .';
                  }

                  if(description.trim().length<10){
                    return 'A descrição precisa no minino 10 letras';
                  }
                  return null;
                }
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'URL da Imagem'
                      ),
                      focusNode: _imageUrlFocus,
                      controller: _imageUrlController,
                      textInputAction: TextInputAction.done,
                     keyboardType:TextInputType.url,
                     onFieldSubmitted:(_)=> _submitForm(),
                     onSaved:(imageUrl)=>_formData['imageUrl']=imageUrl??'',
                     
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(
                        top:10,
                        left: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: _imageUrlController.text.isEmpty? Text('Informe a Url'):
                    FittedBox(
                      child: Image.network(_imageUrlController.text),
                      fit: BoxFit.cover,
                    ) ,
                  )
                ],
              ),
            ]
          )
        ),
      )
    );
  }
}