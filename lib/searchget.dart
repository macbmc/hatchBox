import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


class DataController extends GetxController{
  Future getData(String collection) async{
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }

Future queryData(String queryString) async{
    return FirebaseFirestore.instance.collection('items').where('category',isGreaterThanOrEqualTo: queryString).get();
}
  
}

/*class SearchService{
  searchbyName(String searchField)
  {
    return FirebaseFirestore.instance.collection('items')
        .where('skey',isEqualTo: searchField.substring(0,1).toUpperCase())
        .get();
  }
}*/
