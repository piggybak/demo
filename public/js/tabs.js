jQuery(document).ready(function(){
	//jQuery tab
	jQuery(".tab-content,.tab2-content").hide(); //Hide all content
	jQuery("ul.tabs li:first, ul.tabs2 li:first").addClass("active").show(); //Activate first tab
	jQuery(".tab-content:first,.tab2-content:first").show(); //Show first tab content
	//On Click Event
	jQuery("ul.tabs li").click(function(e) {
		e.preventDefault();
		jQuery("ul.tabs li").removeClass("active"); //Remove any "active" class
		jQuery(this).addClass("active"); //Add "active" class to selected tab
		jQuery(".tab-content").hide(); //Hide all tab content
		var active_url = jQuery(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		window.location.hash = active_url;
		var activeTab = active_url.replace(/#/, '#tab_');
		jQuery(activeTab).fadeIn(200); //Fade in the active content
	});
	jQuery("ul.tabs2 li").click(function(e) {
		e.preventDefault();
		jQuery("ul.tabs2 li").removeClass("active"); //Remove any "active" class
		jQuery(this).addClass("active"); //Add "active" class to selected tab
		jQuery(".tab2-content").hide(); //Hide all tab content
		var active_url = jQuery(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		window.location.hash = active_url;
		var activeTab = active_url.replace(/#/, '#tab_');
		jQuery(activeTab).fadeIn(200); //Fade in the active content
	});
	if(window.location.hash != '') {
		var tab = window.location.hash.replace('#', '.');
		jQuery(tab).click();
	}
});
