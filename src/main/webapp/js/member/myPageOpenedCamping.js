// $(function() {
//
//     $(".OC").click(function(){
//         var nickname = $(this).text();
//         console.log(nickname)
//         $.ajax({
//             url:"/member/myPageOpenedCamping",
//             data :{
//                 nickname:nickname
//             }
//             ,success:function(result){
//                 $("#gatherno").val(result.gatherno);
//                 $("#title").val(result.title);
//                 $("#nickname").val(result.nickname);
//                 $("#place").val(result.place);
//                 $("#createdate").val(result.createdate);
//             }
//         });
//     });
// });