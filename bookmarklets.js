javascript:(function(){
    /* Open youtube video with embed url */
    var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
    var match = window.location.href.match(regExp);
    window.location.href = "https://youtube.com/embed/"+match[7];
})();
