$(document).ready(login);
$(document).on("page:load", login);


function login(){
	console.log("login is loading")
	$(".search-button").click(function(){
		console.log('clicked')
		$(".search-box").toggle("fast");
	});
}