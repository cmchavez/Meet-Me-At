$(document).ready(toggle);
$(document).on("page:load", toggle);


function toggle(){
	
	$(".navbar-toggle").click(function(){
	$(".user-profile").toggle("slow")
	});
}
