// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

// BEGIN VENDOR JS FOR PAGES (plus add in jquery.turbolinks)
//= require pages-plugins/pace/pace.min
//= require jquery
//= require jquery_ujs
//= require pages-plugins/modernizr.custom
//= require pages-plugins/bootstrapv3/js/bootstrap
//= require pages-plugins/jquery/jquery-easy
//= require pages-plugins/jquery-unveil/jquery.unveil.min
//= require pages-plugins/jquery-bez/jquery.bez.min
//= require pages-plugins/jquery-ios-list/jquery.ioslist.min
//= require pages-plugins/imagesloaded/imagesloaded.pkgd.min
//= require pages-plugins/jquery-actual/jquery.actual.min
//= require pages-plugins/jquery-scrollbar/jquery.scrollbar.min
//= require pages-plugins/switchery/js/switchery.min

// BEGIN CORE TEMPLATE JS FOR PAGES
//= require pages-core/js/pages

// BEGIN SITE SCRIPTS

// Zach R. : Disabled turbolinks for now since it breaks rails when linking to other pages
// Issue described in comments here:
// https://themeforest.net/item/pages-admin-dashboard-template-web-app/9694847/comments?utf8=%E2%9C%93&term=turbolink&from_buyers_and_authors_only=0&order_by=relevance

//  I prefer to list scripts in a specific order, so I comment out require_tree .
// require_tree .
// require turbolinks


$(document).delegate ("[data-remote='true']","ajax:complete", function(evt, xhr, status){

    // if (status == 'success'){
      ajax_success(this,xhr.responseText,status,xhr)
    // }

});

var ajax_success = function(target, data, status, xhr){
  // console.log('ajax success! ');
  // console.log(target);
  var element = $(target);
  var where = $(element.data('where'));
  where.html(data);

}
