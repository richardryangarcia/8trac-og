/**
 * Created by zachrdz on 2/13/17.
 */

 // $('#filterOrdersModal .close').on("click", function(e) {
 //     // Reset modal form values on close
 //     $('#new_user_broker')[0].reset();
 // });

 var filterModalDiv = $('#filter_modal');

 filterModalDiv.on("click", '.filterOrdersModalToggler', function(e) {
     if (e.originalEvent.isTrusted) { // Click event triggered by mouse
             // Display modal
             $('#filterOrdersModal').modal('show');
         }
     
 });
