/**
 * 
 */

function prevBtn(pb) {
	let prev = pb - 1;
	location.href = "/supply/supplyList?currentPage=" + prev + "";
}
function currentPage(p) {
	location.href = "/supply/supplyList?currentPage=" + p + "";
}
function nextBtn(nb) {
	let next = nb + 1;
	location.href = "/supply/supplyList?currentPage=" + next + "";
}