import 'package:flutter/material.dart';

class LoadingProviderClass extends ChangeNotifier {
  bool showLoginLoading = false;
  bool showPageLoading = false;
  bool showFilterLoading = false;
  bool showLanguageLoading = false;
  bool chatSupportLoading = false;
  bool showUploadLoading = false;
  bool showDownloadLoading = false;
  bool compareLoading = false;
  bool showCheckInOutLoading = false;
  bool showExitVisitorLoading = false;

  bool showAddOptionError = false;

  setLoginLoading(bool loading) {
    showLoginLoading = loading;
    notifyListeners();
  }

  setCheckInOutLoading(bool loading) {
    showCheckInOutLoading = loading;
    notifyListeners();
  }

  setExitVisitorLoading(bool loading) {
    showExitVisitorLoading = loading;
    notifyListeners();
  }

  setDownloadLoading(bool loading) {
    showDownloadLoading = loading;
    notifyListeners();
  }

  setUploadLoading(bool loading) {
    showUploadLoading = loading;
    notifyListeners();
  }

  setShowAddOptionError(bool loading) {
    if (loading) {
      if (!showAddOptionError) {
        showAddOptionError = true;
        notifyListeners();
      }
    } else {
      if (showAddOptionError) {
        showAddOptionError = false;
        notifyListeners();
      }
    }
  }

  setChatSupportLoading(bool loading) {
    chatSupportLoading = loading;
    notifyListeners();
  }

  setPageLoading(bool loading) {
    showPageLoading = loading;
    notifyListeners();
  }

  setShowFilterLoading(bool loading) {
    showFilterLoading = loading;
    notifyListeners();
  }

  setShowLanguageLoading(bool loading) {
    showLanguageLoading = loading;
    notifyListeners();
  }

  setCompareLoading(bool loading) {
    compareLoading = loading;
    notifyListeners();
  }

  listen() {
    notifyListeners();
  }
}
