var NewContent='<div class="musical-notes"><div class="note-1">&#9835; &#9833;</div><div class="note-2">&#9833;</div><div class="note-3">&#9839; &#9834;</div><div class="note-4">&#9834;</div></div>'

const initFinishedButton = () => {
    $("#finished-button").click(function( event ) {
    event.preventDefault();
    $("#finished-button").append(NewContent);
    $.ajax({
      success: function () {
          window.setTimeout(function () {
              window.location = url;
          }, 2000);
      }
    });
  });
};

export { initFinishedButton };
