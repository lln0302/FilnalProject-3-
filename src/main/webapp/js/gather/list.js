// 페이징 처리(가운데 숫자)
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