$(document).ready(function(){
  const $updateBtn = $(".update-btn");
  console.log($updateBtn);

  $updateBtn.click(function(){
    $updateId = $(this).parent().siblings(".id");
    $.post("UpdateOrderServlet", {id: $updateId.html()});
  });
});