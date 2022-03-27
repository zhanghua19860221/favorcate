import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx)=> HYFilterViewModel()),
  ChangeNotifierProxyProvider<HYFilterViewModel,HYMealViewModel>(
    create: (ctx) => HYMealViewModel(),
    update: (ctx, filterVM, mealVM) {
      mealVM.updateFilters(filterVM);
      return mealVM;
    },
  ),
  ChangeNotifierProxyProvider<HYFilterViewModel, HYFavorViewModel>(
    create: (ctx) => HYFavorViewModel(),
    update: (ctx, filterVM, favorVM) {
      favorVM.updateFilters(filterVM);
      return favorVM;
    },
  ),
];