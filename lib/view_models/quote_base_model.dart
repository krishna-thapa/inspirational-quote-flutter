import 'package:inspirational_quote_flutter/view_models/base_model.dart';

class QuoteBaseModel<T> extends BaseModel {
  bool error = false;
  String errorMsg = "Something went wrong!";
  T quote;

  void setReturnState(T getResult) {
    error = false;
    quote = getResult;
    setLoadingAsFalse();
    notifyListeners();
  }

  void setErrorState(String getErrorMsg) {
    error = true;
    errorMsg = getErrorMsg.isEmpty ? errorMsg : getErrorMsg;
    setLoadingAsFalse();
    notifyListeners();
  }
}
