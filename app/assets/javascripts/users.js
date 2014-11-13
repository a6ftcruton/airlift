$( document ).ready(function() {
  $userInput = $('select#user_vendor_id');
  $userInput.hide();
  $('select#user_role').change(function() {
    var inputVal = $(this).val();
    if (inputVal == "vendor_admin") {
      $userInput.show();
    } else {
      $userInput.hide();
    }
  });
});
