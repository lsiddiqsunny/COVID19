/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
  String _age;
  String _sex;
  String _heartdisease;
  String _lungdisease;
  String _diabetes;
  String _fever;
  String _cough;
  String _shortnessofbreathe;
  String _pressureinthechest;
  String _closecontactwithcoronapatient;
  String _traveledcountry;
  String _currentaddress;
  String _coronapatient;

  FeedbackForm(this._age, this._sex, this._heartdisease, this._lungdisease,this._diabetes,this._fever,this._cough,this._shortnessofbreathe,this._pressureinthechest,this._closecontactwithcoronapatient,this._traveledcountry,this._currentaddress,this._coronapatient);

  // Method to make GET parameters.
  String toParams() => 
  "?age=$_age&sex=$_sex&heart_disease=$_heartdisease&lung_disease=$_lungdisease&diabetes=$_diabetes&fever=$_fever&cough=$_cough&shortness_of_breathe=$_shortnessofbreathe&pressure_in_the_chest=$_pressureinthechest&close_contact_with_corona_patient=$_closecontactwithcoronapatient&traveled_country=$_traveledcountry&current_address=$_currentaddress&corona_patient=$_coronapatient";
}