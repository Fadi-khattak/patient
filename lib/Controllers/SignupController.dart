
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:patient/Views/Dashboard.dart';

class SignupController extends GetxController
{
  String pic="https://firebasestorage.googleapis.com/v0/b/weightloss-f9b95.appspot.com/o/ToDIDJiXxo6cA8aJ1chE.png?alt=media&token=823eb8f7-b891-46bc-a047-119892bfba8b";
  var isLoading=false.obs;

  Future createAccount(String email,String password,String name)async
  {
    try{
      isLoading.value=true;
      UserCredential uc=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).timeout(const Duration(seconds: 15),onTimeout: (){
        throw "connection timeout";
      });
      if(uc.user!=null)
        {
         await uploadDetails(name,pic,"0",uc.user!.uid);
        }
    }catch(e)
    {
      isLoading.value=false;
      Get.snackbar("Error", e.toString());
    }
  }
  Future uploadDetails(String name,String pic,String status,String id)async
  {
    try{
      final ref=await FirebaseDatabase.instance.ref("patient").child(id);
      var data=
      {
        'name':name,
        'pic':pic,
        'id':id
      };
      await ref.set(data);
      isLoading.value=false;
      Get.offAll(()=>Dashboard());
      Get.snackbar("success", "account created");
    }catch(e)
    {
      isLoading.value=false;
      Get.snackbar("Error", e.toString());
    }
  }
}