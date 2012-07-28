// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
win.add(label);
win.open();

var statusbaroverlay = require('mattapp.statusbar');

//displays a message in the status bar, that is dismissed when tapped
statusbaroverlay.postMessage("Posting to Twitter");
//you can also set a timeout to auto hide the message
//statusbaroverlay.postMessage("Posting to Twitter", 3.0);

//displays a message in the status bar with an activity indicator on the left side, that is dismissed when tapped
statusbaroverlay.postMessageInProgress("Posting to Twitter");
//you can also set a timeout to auto hide the message
//statusbaroverlay.postMessageInProgress("Posting to Twitter", 3.0);

//displays a message in the status bar with a check on the left side, that is dismissed after a timeout
statusbaroverlay.postFinishMessage("Message was posted to Twitter", 2.0);

//displays a message in the status bar with an X the left side, that is dismissed after a timeout
statusbaroverlay.postErrorMessage("Error posting to Twitter", 2.0);

//hide the statusbaroverlay but keep its current message displayed
statusbaroverlay.hide();

//show the statusbaroverlay if any messages were hidden
statusbaroverlay.show();

//hide and clear the statusbar
statusbaroverlay.stop();