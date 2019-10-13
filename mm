
function buscarTodo()
{
	document.getElementById("resultados").innerHTML = "";
	busqueda('\S+.jpg|.gif|.png|.bmp|.tiff|.webp|.jpeg|.tf|.raw|.psd|.dib|.jpe|.jfif',  "\n busqueda de las imagenes\n");
	busqueda('<title>\s+<title>$', "\n busqueda de los titulos\n");
	busqueda('', "\n cambiar las urls largas por cortas\n");
	busqueda('<!--\S+-->$',"\n borar todo los comentarios\n");
	busqueda('<p>\S+</p>$', "\n busqueda del contenido de la etiqueta parafo\n");
	


}
	
		
   				
function busqueda(patron, Titulo) {
    
    // document.getElementById("demo").innerHTML =
    // "Welcome 																								" + name + ", the " + job + ".";

    var texto = document.getElementById("entrada").textContent;
    texto = texto.replace(/\./g,"");					
    texto = texto.replace(/\,/g,"");
    texto = texto.replace(/\n/g," ");

    
	var	palabras = texto.split(" ");
	


	// var regex1 = RegExp('^[a-z0-9]{7,7}$','g');
	var regex1 = RegExp(patron,'g')
	var str1 = 'table football, foosball 1234567 abcdefg';	
	var array1;

	var resultados = document.getElementById("resultados");
	
	var tituloHTML = document.createElement("label");
	tituloHTML.setAttribute("for",Titulo);
	tituloHTML.innerHTML = Titulo;
	resultados.appendChild(tituloHTML);

	var lista = document.createElement("UL");

	palabras.forEach(function(value,index, ar){
		
		if(regex1.exec(value) !== null){
			// console.log(value);
			var elemento = document.createElement("LI");
			var textnode = document.createTextNode(value);
			elemento.appendChild(textnode);
			lista.appendChild(elemento);
		}
	});

	resultados.appendChild(lista);
// while ((array1 = regex1.exec(str1)) !== null) {
//   console.log(`Found ${array1[0]}. Next starts at ${regex1.lastIndex}.`);
//   // expected output: "Found foo. Next starts at 9."
//   // expected output: "Found foo. Next starts at 19."
// }


}

document.getElementById("cuadro1").addEventListener("change", function(){
	var fr = new FileReader("UTF-8");
	fr.onload = function(){
		document.getElementById("entrada").textContent = this.result;
	}
	fr.readAsText(this.files[0],'ISO-8859-1');
});	
