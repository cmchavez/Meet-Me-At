$(document).ready(login);
$(document).on("page:load", login);


function login(){
	console.log("login is loading")
	$("button").click(function(){
		console.log('clicked')
		$(".login1").fadeOut("fast");
		$(".signin").fadeIn("fast");
		$(".nav_signup").fadeIn("fast");

	});

}

//    console.log("jquery is loaded")
//     $(".btn").click(function(){
//         console.log("click happened")
//         $(".pretty").fadeOut("slow");
//     })
// })
