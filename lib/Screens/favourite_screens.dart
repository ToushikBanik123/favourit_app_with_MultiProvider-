import 'package:favourite/Provider/favourite_provider.dart';
import 'package:favourite/Screens/myFavouriteList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class Favourite_Screen extends StatelessWidget {
   const Favourite_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final FavouriteItemProvider = Provider.of<FavouriteItemProvider>(context);
    //not working
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite App"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return MyFavouriteList();
                })
              );
            },
            child: const Icon(Icons.favorite,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 20,),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context,index){
                  return Consumer<FavouriteItemProvider>(builder: (context,provider,child){
                    return ListTile(
                      onTap: (){
                        if(provider.selectedItem.contains(index)){
                          provider.removeItem(index);
                        }else{
                          provider.addItem(index);
                        }
                      },
                      title: Text("Product " + index.toString()),
                      trailing: provider.selectedItem.contains(index)?
                      Icon(Icons.favorite):
                      Icon(Icons.favorite_border_outlined),
                    );
                  }
                  );
                }
                ),
          )
        ],
      ),
    );
  }
}
