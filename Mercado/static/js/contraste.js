function contraste() {
 
$(document).ready(function(){
	var body = document.body;
    
	if($('#altocontraste').click) {
		if(localStorage.getItem('contrast-color')) {
			localStorage.setItem('contrast-color', '');
			body.classList.remove('contrast');
		} else {
			populateStorage('contrast');
		}
	}
	else { 
		if(localStorage.getItem('contrast-color')) {
			body.classList.add('contrast');
		} 
	}
	function populateStorage(str) {
		localStorage.setItem('contrast-color', str);
		setStyles();
	}
	
	function setStyles() {
		var currentColorContrast = localStorage.getItem('contrast-color');
		body.classList.add(currentColorContrast);
		
	}
});



}
