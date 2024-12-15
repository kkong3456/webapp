import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IconSearchbar extends StatelessWidget implements PreferredSizeWidget {
  const IconSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          // Lottie.asset('lottie/movie.json',height:80),
          const SizedBox(width:15,),
          Container(
            width:MediaQuery.of(context).size.width*.55,
            height:45,
            decoration:BoxDecoration(
              color:Colors.white,
              borderRadius:BorderRadius.circular(6),
            ),
            child:TextField(
              decoration:InputDecoration(
                prefixIcon:const Icon(Icons.search),
                suffixIcon:IconButton(
                  onPressed:(){},
                  icon:const Icon(Icons.cancel),
                ),
                hintText:'Search',
                border:InputBorder.none ,
              ),
              style:const TextStyle(
                color:Colors.grey,
                fontWeight:FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}
