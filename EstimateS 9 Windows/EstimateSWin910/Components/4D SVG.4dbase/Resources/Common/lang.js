<!--

// Display the localized help file according to the browser lang
// Uncomment or add a "else if" clause

if (navigator.browserLanguage)
	var language = navigator.browserLanguage;
else
	var language = navigator.language;
		
if (language.indexOf('fr') > -1) document.location.href = 'http://doc.4d.com/4D-SVG-12/4D-SVG.100-357567.fr.html';
		
	else if (language.indexOf('en') > -1) document.location.href = 'http://doc.4d.com/4D-SVG-Component-12/4D-SVG-Component.100-357567.en.html';
		
//	else if (language.indexOf('ja') > -1) document.location.href = 'Resources/Japanese.lproj/Help/Help.html';
		
//	else if (language.indexOf('es') > -1) document.location.href = 'Resources/Spanish.lproj/Help/Help.html';
		
//	else if (language.indexOf('de') > -1) document.location.href = 'Resources/German.lproj/Help/Help.html';
		
//	else if (language.indexOf('it') > -1) document.location.href = 'Resources/Italian.lproj/Help/Help.html';
		
else
		
	document.location.href = 'http://doc.4d.com/4D-SVG-Component-12/4D-SVG-Component.100-357567.en.html';

// -->		