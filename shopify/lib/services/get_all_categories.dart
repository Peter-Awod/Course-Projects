

import '../shared/components/constants.dart';
import '../shared/network/api.dart';


class AllCategoriesService{

  Future<List<dynamic>>getAllCategories()async{

    List<dynamic> json =await Api().get(url: kGetAllCategories);


    return json;
  }
}