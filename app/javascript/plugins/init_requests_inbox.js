const initRequestsInbox = () => {


    $(".rehearsal-panel .card-request:first").addClass("active-request");
    $(".incoming-requests").hide();
    var activeTab = $(".rehearsal-panel .card-request:first").attr("rel");
    $("."+activeTab).show();

    $(".rehearsal-panel .card-request").click(function() {

      $(".incoming-requests").hide();
      var activeTab = $(this).attr("rel");
      $("."+activeTab).fadeIn();
      $(".rehearsal-panel .card-request").removeClass("active-request");
      $(this).addClass("active-request");

      visitedPage = 1


    });



};

export { initRequestsInbox };
