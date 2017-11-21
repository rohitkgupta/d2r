<!-- Fancy Box -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript" src="resources/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="resources/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script src="resources/js/jquery.ui.totop.js"></script>
<script>
$( document ).ready(function() {
	$('a#requestACall').fancybox({
		'height'			:'5',
		'width'				:'5',
		'autoScale'			: false,
		'transitionIn'		: 'none',
		'transitionOut'		: 'none',
		'titlePosition'		: 'outside',
		'type'				: 'iframe',
		'overlayColor'		: '#000',
		'overlayOpacity'	: 0.7
	});
});

</script>
