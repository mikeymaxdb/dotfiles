javascript:(function(){
    /* Make a new WeVideo account */
    var a = Date.now();
    $("input[name=firstName],input[name=lastName],input[name=signupPass]").val(a);
    $("input[name=signupMail]").val(a+"@testing.wevideo.com");
    $(".SignupForm input[type=submit]").click();
})();

javascript:(function(){
    /* Open youtube video with embed url */
    var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
    var match = window.location.href.match(regExp);
    window.location.href = "https://youtube.com/embed/"+match[7];
})();
