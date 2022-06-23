function fonte(e) {

	var elemento = $(".acessibilidade");
	var fonte = parseInt(elemento.css('font-size'));
	
	fonte = localStorage.getItem('font-size');
	if (fonte == null) {
		fonte = 16;
	}

	var body = $("body");
	const fonteNormal = parseInt(body.css('font-size'));


	if (e == 'a') {
		fonte++;
	}
	if (e == 'd'){
		fonte--;
	}
	if (e == 'n'){
		fonte = 16;
	}
	
	localStorage.setItem('font-size', fonte);
	elemento.css("fontSize", fonte);
	
}