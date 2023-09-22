javascript:(function(){
    /* Open youtube video with embed url */
    var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
    var match = window.location.href.match(regExp);
    window.location.href = "https://youtube.com/embed/"+match[7];
})();

javascript:(function(){
    /* Open all videos from Pinkbike's 'Movies for your monday' */
    /* Disable your popup blocker! */
    var urls = [];
    document.querySelectorAll('iframe').forEach((node) => {
        if (node.src.includes('youtube')) {
            urls.push(node.src);
        }
    });
    document.querySelectorAll('.pbvideo').forEach((node) => {
        urls.push(`https://www.pinkbike.com/v/embed/${(node.id.replace('pbvideo-', ''))}`);
    });
    urls.forEach((url) => window.open(url, '_blank'));
})();

javascript:(function(){
    /* Converts the page to dark mode */
    var sheet = window.document.styleSheets[0];
    sheet.insertRule('body { filter: invert() saturate(.5) hue-rotate(180deg); background-color: #333; }', sheet.cssRules.length);
    sheet.insertRule('img,svg { filter: invert() saturate(2) hue-rotate(180deg); }', sheet.cssRules.length);
})();
