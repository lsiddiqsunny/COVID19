/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
  String age;
  String sex;
  String heartdisease;
  String lungdisease;
  String diabetes;
  String fever;
  String cough;
  String shortnessofbreathe;
  String pressureinthechest;
  String closecontactwithcoronapatient;
  String traveledcountry;
  String currentaddress;
  String coronapatient;

  FeedbackForm(){
    age = sex = heartdisease = lungdisease = diabetes = fever = cough =  shortnessofbreathe = pressureinthechest = closecontactwithcoronapatient = traveledcountry = currentaddress = coronapatient = "Unspecified" ;
  }


  // Method to make GET parameters.
  String toParams() => 
  "?age=$age&sex=$sex&heart_disease=$heartdisease&lung_disease=$lungdisease&diabetes=$diabetes&fever=$fever&cough=$cough&shortness_of_breathe=$shortnessofbreathe&pressure_in_the_chest=$pressureinthechest&close_contact_with_corona_patient=$closecontactwithcoronapatient&traveled_country=$traveledcountry&current_address=$currentaddress&corona_patient=$coronapatient";
}