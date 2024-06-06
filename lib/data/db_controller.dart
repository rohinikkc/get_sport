import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:getsport/data/model/coach_model.dart';
import 'package:getsport/presentation/widget/helper.dart';
import 'package:image_picker/image_picker.dart';

class DbController{
final db=FirebaseFirestore.instance;
final auth=FirebaseAuth.instance;
final storage=FirebaseStorage.instance;

//..................Authentication


Future <UserCredential>createaccount(context,email,password)async{
try{
   return await auth.createUserWithEmailAndPassword(email: email, password: password);


} catch(errors){
  return Helper.errorSnackBar(context, "Error :${errors}");
}
}



//===================================================//==================================================//
//...............................store image

 Future<String> uploadImage(XFile imageFile,String path) async {
  SettableMetadata metadata=SettableMetadata(contentType: "image/jpeg");
    final storageRef = FirebaseStorage.instance.ref().child('$path/${imageFile.name}');
    try {
      final uploadTask = storageRef.putFile(File(imageFile.path),metadata);
      final snapshot = await uploadTask.whenComplete(() => null);
      return await snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e.message);
      return '';
    }
  }




//===========================================//==========================================================//


//=====================DELETE DOC

deleteSelectedDoc(collectionName,docId)async{
db.collection(collectionName).doc(docId).delete();
}
//-------------Trainer--------------
addNewCoach(CoachModel coachModel)async{
  db.collection("Coachs").doc(coachModel.coachId).set(coachModel.toJosn());
}

getAllTrainer(){
  return db.collection("Coachs").snapshots();
}

updateTrainerData(CoachModel coachModel){
  db.collection("Coachs").doc(coachModel.coachId).update(coachModel.toJosn());

}



//-----------------------------//-------------------------//

//-----------------------------CLUB CLUB--------------------------//\\

// addNewClub()async{
//     db.collection("Coachs").doc(coachModel.coachId).set(coachModel.toJosn());


// }


}