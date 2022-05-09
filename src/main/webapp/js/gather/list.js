function prevBtn(pb){
	let prev = pb-1;
	location.href="/gather/gatherList?currentPage="+prev+"";
}
function currentPage(p){
	location.href="/gather/gatherList?currentPage="+p+"";
}
function nextBtn(nb){
	let next = nb+1;
	location.href="/gather/gatherList?currentPage="+next+"";
}