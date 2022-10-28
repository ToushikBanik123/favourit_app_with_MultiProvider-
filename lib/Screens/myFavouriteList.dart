import 'package:favourite/Provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyFavouriteList extends StatelessWidget {
  const MyFavouriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Consumer<FavouriteItemProvider>(builder: (context,provider,child){
        return ListView.builder(
            itemCount: provider.selectedItem.length,
            itemBuilder: (context,index){
              return ListTile(
                onTap: (){
                  if(provider.selectedItem.contains(provider.selectedItem[index])){
                    provider.removeItem(provider.selectedItem[index]);
                  }else{
                    provider.addItem(provider.selectedItem[index]);
                  }
                 },
                title: Text("Product " + provider.selectedItem[index].toString()),
                trailing: provider.selectedItem.contains(provider.selectedItem[index])?
                Icon(Icons.favorite):
                Icon(Icons.favorite_border_outlined),
              );
            });
      })
    );
  }
}
