var puzzleBody = "Your text Will show up here.";
var x = 25;
var fontColor = '#000000';
var drawCanvas = function(){
    // set context and formatting
	var fv = $('#canvas').css('font-family');
	var size =  $('#sizeInput').val();
	var canvas = document.getElementById("canvas");
    var context = canvas.getContext('2d');
	var x = parseInt(parseInt( $('#slider a').css('left') )*9.4);
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
	var y = parseInt($('#vOffset').val());
   	var linespacing = parseInt(parseInt(size*1.3));
    console.log('linespacing: ' + linespacing + ' textval: ' + textval + 'textvalArr: ' +textvalArr);

    // draw each line on canvas. 
    for(var i = 0; i < textvalArr.length; i++){
        context.fillText(textvalArr[i], x, y);
//			context.strokeStyle = $('#strokeSelector img').css('background-color');
//			context.strokeText(textvalArr[i], x, y);
        y += linespacing;
    }
}

// Creates an array where the <br/> tag splits the values.
var toMultiLine = function(text){
   var textArr = new Array();
   text = text.replace(/\n\r?/g, '<br/>');
   textArr = text.split("<br/>");
   return textArr;
};

$(document).ready(function() {
	var cleared;

	$('#puzzleBody').click(function(){
		if (cleared !== 1) {
			$(this).val("");
			cleared = 1;
		}
	});
 $("#slider").slider({min: 0, max: 100}).bind( "slide", function(event, ui) {
  var hOffset = ui.value;
  drawCanvas();
});;
	var canvas = document.getElementById("canvas");
	$('#customSize').click( function() {
		$('#sizeInput').focus().val("");
	});
	$('#sizeInput').keyup(function() {
		drawCanvas();
	});
	$('#sizeInput').click(function() {
		$('this').val("");
	});
	$('#hOffset').change(
		function()	{
			drawCanvas();
		}
	);
	$('#vOffset').change(
		function()	{
			drawCanvas();
		}
	);
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
	$('#strokeSelector').ColorPicker({
		onShow: function (colpkr) {
			$(colpkr).fadeIn(500);
			return false;
		},
		onHide: function (colpkr) {
			$(colpkr).fadeOut(500);
			return false;
		},
		onChange: function (hsb, hex, rgb) {
			$('#strokeSelector img').css('backgroundColor', '#' + hex);
			$('#canvas').css('-webkit-text-stroke', '1px #' + hex);

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
		var dataURL = canvas.toDataURL("image/png");
		var base64 = dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
		var puzzleTitle = $('#puzzleTitle').val();
		$.post('/puzzles/upload', {base64: base64, puzzleTitle: puzzleTitle},
			function() {window.location = "/puzzles/" + puzzleTitle + '/show'});
	});
	$('#puzzleTitle').click(function() {$(this).val("")});
	$('#puzzleBody').keyup( function () {
		puzzleBody = $(this).val();
		drawCanvas();
	});
	$('#img_elem').hide();
});
