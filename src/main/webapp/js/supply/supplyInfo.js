/**
 * 
 */
 
 function popup() {
	alert(window.innerHeight-700);
	window.open("supplyChat", "chatting", 
				"width=450,height=700,top=" + (window.innerHeight-400)
				+ ",left=" +(window.innerWidth-400));
}