/*
Simple Lightbox created by Tim Inman

Chris Campbell
Website: http://inmans.org
Date: 10 Jan 2011

This is good for one-liners, but needs some work for larger boxes.
At the minute it requires prototype for the observe line.
*/


var say = function (message) {
	var alertbox = document.createElement('div');
	var paratext = document.createElement('p');
	var closebox = document.createElement('a');
	var overlay = document.createElement('div');
	var closeUp = function () {

		overlay.fade();
		alertbox.fade();
		setTimeout(function () {window.location = '/'; }, 500);
	};
	
	overlay.style.width = (document.width) + 'px';
	overlay.style.height = (document.height) + 'px';
	overlay.id = 'overlay';
	document.body.appendChild(overlay);
	closebox.href = '#';
	closebox.innerHTML = "x";
	closebox.id = "closebox";
	alertbox.style.left = (document.width - alertbox.style.width) / 2 - 50 + 'px';	
	alertbox.id = 'alertbox';
	paratext.id = 'paratext';
	paratext.innerHTML = message.toString();
	document.body.appendChild(alertbox);
	alertbox.appendChild(closebox);
	alertbox.appendChild(paratext);
	closebox.observe('click', closeUp);
};