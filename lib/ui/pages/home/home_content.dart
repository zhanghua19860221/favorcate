import 'package:flutter/material.dart';
import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/core/extension/int_extension.dart';
import 'package:favorcate/core/services/json_parse.dart';
import 'package:favorcate/ui/pages/home/home_category_item.dart';
class HYHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HYCategoryModel>>(
      future:HYJsonParse.getCategoryData(),
      builder: (ctx,snapshot){
        //返回一个网络请求的 菊花条
        if(!snapshot.hasData) return Center(child: CircularProgressIndicator());
        if(snapshot.error != null) return Center(child: Text("请求失败"),);
        final categories = snapshot.data;
        return GridView.builder(
            padding: EdgeInsets.all(20.px),
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.px,
              mainAxisSpacing: 20.px,
              childAspectRatio: 1.5
            ),
            itemBuilder: (ctx, index){
              return HYHomeCategoryItem(categories[index]);
            }
        );
      },
    );
  }
}


//第一种实现方法
// class HYHomeContent extends StatefulWidget {
//   @override
//   _HYHomeContentState createState() => _HYHomeContentState();
// }
//
// class _HYHomeContentState extends State<HYHomeContent> {
//
//   List<HYCategoryModel> _categories = [];
//
//  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     JsonParse.getCategoryData().then((value){
//       setState(() {
//         _categories = value;
//       });
//     });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         padding: EdgeInsets.all(20.px),
//         itemCount: _categories.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 20.px,
//           childAspectRatio: 1.5,
//           mainAxisSpacing: 20.px,
//         ),
//         itemBuilder:(ctx, index){
//           final bgColor = _categories[index].cColor;
//           return Container(
//             decoration: BoxDecoration(
//               color: bgColor,
//               borderRadius: BorderRadius.circular(12.px),
//               //颜色渐变
//               gradient: LinearGradient(
//                 colors: [
//                   bgColor.withOpacity(.5),
//                   bgColor
//                 ]
//               )
//             ),
//             alignment: Alignment.center,
//             child: Text(
//                 "${_categories[index].title}",
//                  style: Theme.of(context).textTheme.display2.copyWith(
//                    fontWeight: FontWeight.bold
//                  ),
//             ),
//
//           );
//
//         }
//     );
//   }
// }
