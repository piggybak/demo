jQuery(document).ready(function(){
//Set opacity on each span to 0%

jQuery('.ts-display-pf-img').hover(
    function() {
        jQuery(this).find('.rollover').stop().fadeTo(500, 0.60);
    },
    function() {
		jQuery(this).find('.rollover').stop().fadeTo(500, 0);
    }
)


});