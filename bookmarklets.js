javascript:(function(){
	/* Make a new WeVideo account */
	var a = Date.now();
	$("input[name=firstName],input[name=lastName],input[name=signupPass]").val(a);
	$("input[name=signupMail]").val(a+"@testing.wevideo.com");
	$(".SignupForm input[type=submit]").click();
})();