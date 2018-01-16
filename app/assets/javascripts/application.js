// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require bootstrap

jQuery(document).ready(function() {
	if(jQuery('.header-side .sidebar-toggle').length) {
		jQuery('.header-side .sidebar-toggle').each(function(index, value) {
			jQuery(this).on('click',function() {
				jQuery('.side-bar').toggleClass('minimal');
			});
		})
	}
	/** has sub */
	if(jQuery('.list_menu .item.has-sub').length) {
		jQuery('.list_menu .item.has-sub').each(function(index, value) {
			jQuery(value).find('a').first().attr('href', '#');
			jQuery(value).on('click', function(e) {
				if(jQuery(this).hasClass('active')) {
					jQuery(this).removeClass('active');
				} else {
					jQuery(this).addClass('active');
				}
				return false;
			});
		});
	}
});