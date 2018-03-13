$('#linkBrokerModal .close').on("click", function(e) {
    // Reset modal form values on close
    $('#new_user_broker')[0].reset();
});

var brokerListDiv = $('#broker_list');

brokerListDiv.on("click", '.brokerLinkModalToggler', function(e) {
    if (e.originalEvent.isTrusted) { // Click event triggered by mouse
        var toggleCheckbox = $(this).find('input')[0];
        var brokerName = $(this).attr("data-broker-name");
        var brokerId = $(this).attr("data-broker-id");
        var brokerNamePlaceholder = $('.link-broker-name-placeholder');
        var brokerNameField = $('#brokers_name');
        var brokerIdField = $('#brokers_id');
        if(toggleCheckbox.checked){ // User attempt to link broker
            // Uncheck the toggle for now, until user is actually linked
            $(toggleCheckbox).click();

            // Fill in placeholder text in modal for broker
            brokerNamePlaceholder.text(brokerName);
            brokerNamePlaceholder.css('textTransform', 'capitalize');

            // Populate hidden form fields
            brokerNameField.val(brokerName);
            brokerIdField.val(brokerId);

            // Display modal
            $('#linkBrokerModal').modal('show');
        } else { // User attempt to unlink broker
            if (confirm('Are you sure you want to unlink your account?')) {
                // Checkbox should be unchecked at this point
                // Grab id of record to be removed
                var userBrokerId = $(this).attr("data-user-broker-id");

                // Call controller action to delete
                $.ajax({
                    type: "DELETE",
                    url: "/user_brokers/" + userBrokerId
                });
            } else {
                // Cancelled, so recheck checkbox
                // Does not re-open prompt
                $(toggleCheckbox).click();
            }
        }
    } else { // Click event triggered by code
    }
});

brokerListDiv.on( "click", '.comingSoonModalToggler', function() {
    $('#modalSlideUpSmall').modal('show');
});

function loadSwitches(){
    // Initializes switchery toggles
    var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
    elems.forEach(function(html) {
        new Switchery(html, {size: 'small', color: '#6D5CAE'});
    });
}
loadSwitches();