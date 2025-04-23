class AppLink {
  static const String server = "http://192.168.1.2/ecommercecourse-PHP--33";

  static const String imagestatic = "$server/upload";
  static const String imagescategories = "$imagestatic/categories";

  static const String test = "$server/test.php";

// // ================================= Auth ========================== //

  static const String signUp = "$server/delivery/auth/signup.php";
  //static const String login = "$server/delivery/auth/login.php";
  static const String verifycodessignup = "$server/auth/verfiycode.php";

// // ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";
  /////////////////////////////////////////
  ///
  static const String pendingorders = "$server/delivery/orders/pending.php";

  static const String acceptedorders = "$server/delivery/orders/accepted.php";
  static const String archiveorders = "$server/delivery/orders/archive.php";
  static const String detailsorders = "$server/delivery/orders/details.php";
  static const String approveorders = "$server/delivery/orders/approve.php";
  static const String ordersdetails = "$server/delivery/orders/details.php";
  static const String ordersdone = "$server/delivery/orders/done.php";
  ////////////////////////////// admain
  static const String login = "$server/admain/auth/login.php";
  ////////////////////category
  static const String viewcategory = "$server/admain/category/view.php";
  //static const String imagestCategories = "$imageststatic/categories";
  static const String addcategory = "$server/admain/category/add.php";
  static const String deletecategory = "$server/admain/category/delete.php";
  //////////////////items
  static const String viewitems = "$server/admain/items/view.php";
  static const String additems = "$server/admain/items/add.php";
  ///////////////////////////////////order
  static const String viewpending = "$server/admain/orders/viewpending.php";
  static const String approveordersss = "$server/admain/orders/approve.php";
  static const String viewaccepted = "$server/admain/orders/viewaccepted.php";
  static const String prepareorders = "$server/admain/orders/prepare.php";
  static const String ordersdetailsssss = "$server/admain/orders/details.php";
  static const String archiveordersssss = "$server/admain/orders/archive.php";
}
