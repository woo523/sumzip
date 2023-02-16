function like_func(){
  var frm_read = $('#frm_read');
  var boardno = $('#boardno', frm_read).val();
  //var mno = $('#mno', frm_read).val();
  //console.log("boardno, mno : " + boardno +","+ mno);
  
  $.ajax({
    url: "../liketo/like.do",
    type: "GET",
    cache: false,
    dataType: "json",
    data: 'boardno=' +boardno,
    success: function(data) {
      var msg = '';
      var like_img = '';
      msg += data.msg;
      alert(msg);
      
      if(data.like_check == 0){
        like_img = "./img/blankheart.png";
      } else {
        like_img = "./img/fullheart.png";
      }      
      $('#like_img', frm_read).attr('src', like_img);
      $('#like_cnt').html(data.like_cnt);
      $('#like_check').html(data.like_check);
    },
    error: function(request, status, error){
      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
  });
}
