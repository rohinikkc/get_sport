class ClubModel{
String id;
String regId;
String email;
String name;
String clubImage;

ClubModel({
  required this.regId,
  required this.clubImage,required this.email,required this.id,required this.name,required 
});

Map<String ,dynamic>toJosn()=>{
"id":id,
"regId":regId,
"email":email,
"name":name,
"clubImage":clubImage
};











}