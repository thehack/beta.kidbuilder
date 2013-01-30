var vOffset = 30;
var hOffset = 30;
var fontColor = '#000000';
var puzzleBody = "It\nShows Up\nHere"

var drawCanvas = function(){
    // set context and formatting
	var fv = $('#canvas').css('font-family');
	var size =  $('#sizeInput').val();
	var canvas = document.getElementById("canvas");
	var context = canvas.getContext('2d');
	var x = hOffset;
	context.clearRect(0,0,940,400);
	context.drawImage( (document.getElementById('img_elem') ), 0, 0, 940, 400);
    context.textAlign = "left";
    context.textBaseline = "top";
    context.fillStyle = fontColor;
	context.font = size + "pt " + fv;
	context.textAlign = 'left';
    // prepare textarea value to be drawn as multiline text.
    var textval = puzzleBody;
    var textvalArr = toMultiLine(textval);
	var y = vOffset;
   	var linespacing = parseInt(parseInt(size*1.3));
    // draw each line on canvas. 
    for(var i = 0; i < textvalArr.length; i++){
        context.fillText(textvalArr[i], x, y);
        y += linespacing;
    }
}

// Creates an array where the <br/> tag splits the values.
var toMultiLine = function(text){
   var textArr = [];
   text = text.replace(/\n\r?/g, '<br/>');
   textArr = text.split("<br/>");
   return textArr;
};

// slice up an image into 10 pieces, save the pieces, base64 encoded in an array.
var slices = [];
var sliceAndDice = function(i) {
	var sliceCanvas = document.getElementById('slices');
	var context = sliceCanvas.getContext('2d');
	context.clearRect(0,0,94,400);
	context.drawImage( document.getElementById('canvas'), i*94, 0, 94, 400, 0, 0, 94, 400);
	slices[i] = sliceCanvas.toDataURL("image/png").replace(/^data:image\/(png|jpg);base64,/, "");
};

$(document).ready(function() {
	// Clear this textarea, but only the first time it is clicked.
	var cleared;
	var canvas = document.getElementById("canvas");

	$('#puzzleBody').click(function(){
		if (cleared !== 1) {
			$(this).val("");
			cleared = 1;
		}
	});

	// Set up draggable positioner
	$('#hmSlider').draggable({ appendTo: $('#canvas'), drag: function(element, ui) {
		hOffset = ui.position.left + 30;
		vOffset = ui.position.top + 30;
		drawCanvas();
	}});
		
	$('#customSize').click( function() {
		$('#sizeInput').focus().val("");
	});
	$('#sizeInput').keyup(function() {
		drawCanvas();
	});
	$('#sizeInput').click(function() {
		$('this').val("");
	});
	$('.size').click(
		function() {
			$('#sizeInput').val( $(this).text() );
			drawCanvas();
		}
	);
	$('#chooseImage').click(function() {
		$.ajax({url: '/backgrounds/list', dataType: 'html', type: 'GET', success: function(data) {say(data)}});
	});
		$('#colorSelector').ColorPicker({
		onShow: function (colpkr) {
			$(colpkr).fadeIn(500);
			return false;
		},
		onHide: function (colpkr) {
			$(colpkr).fadeOut(500);
			return false;
		},
		onChange: function (hsb, hex, rgb) {
			fontColor = '#' + hex;
			drawCanvas();
		}
	});
	$('#align').change(function() {
		$('#canvas').css('text-align', $(this).val());
		drawCanvas();
	});
	$('.fontSelect').click(function(){
		$('#canvas').css('font-family', $(this).text());
		drawCanvas();
	});
	$.each($('.fontSelect'), function(index, value) { 
			$(value).css('font-family', $(value).text())
	});
	$('#save').click(function() {
		drawCanvas();
		for (var i = 0; i < 10; i++) {
			sliceAndDice(i)
		};
		var puzzleTitle = $('#puzzleTitle').val();
		$.ajax({type: 'POST',
				url: '/puzzle/upload', 
				beforeSend: function() {$(document.body).spin()},
				data: {slices: slices, puzzleTitle: puzzleTitle},
				success: function(data) {window.location = "/puzzle/" + data + '/show'} 
		});
	});
	$('#puzzleTitle').click(function() {$(this).val("")});
	$('#bgImages a').click(function() {
		$('#img_elem').replaceWith("<img src='" + $(this).attr('class') + "' id='img_elem' />");
		$('#img_elem').hide();
		var url = "url(" + $(this).attr('class') + ")";
		$('#workArea').css('background-image', url);
		drawCanvas();
		return false;
	});
	$('#puzzleBody').keyup( function () {
		puzzleBody = $(this).val();
		drawCanvas();
	});
	$('#img_elem').hide();
	$('ul.nav').hide(); // don't really need all the nav. simple and clean
	drawCanvas();

});