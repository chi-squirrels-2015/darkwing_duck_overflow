$(document).ready(function() {
  $("a.fa").on("click", function(event){
    event.preventDefault();

  //   var id = $(this).parent().attr('id');

  //   var request = $.ajax({
  //     type: 'put',
  //     url: '/questions/'+id+'/upvote'
  //   });

  //   request.done(function(response) {
  //     console.log(response)
  //   $("#"+id+" .points").html(response.points);
  //   $("#"+id+" a.fa").css("color", "red");
  //    });


  });

});



  // $("fa").on("click", function(event){
  //   event.preventDefault();

  //   var id = $(this).parent().attr('id');

  //   var request = $.ajax({
  //     type: 'get',
  //     url: '/posts/'+id+'/downvote'
  //   });

  //   request.done(function(response) {
  //     console.log(response)
  //   $("#"+id+" .points").html(response.points);
  //   $("#"+id+" a.fa").css("color", "red");
  //    });

