/**
 * 
 */
 
 $(function() {
	//페이지 로딩 시 '서울'키워드로 지도+리스트 초기화
	displayPlaces();
});
 
 


// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level: 3 // 지도의 확대 레벨
	};

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

var titlee = 'title';
// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces() {
	var regionSearch = $("#keyword").val();

	var places = $("#clListLen").val();

	var listEl = document.getElementById('placesList'),
		menuEl = document.getElementById('menu_wrap'),
		fragment = document.createDocumentFragment(),
		bounds = new kakao.maps.LatLngBounds(),
		listStr = '';

	// 검색 결과 목록에 추가된 항목들을 제거합니다
	removeAllChildNods(listEl);

	// 지도에 표시되고 있는 마커를 제거합니다
	removeMarker();

	for (var i = 0; i < places; i++) {
		if (regionSearch == $("#plRegion" + i).val()) {
			console.log("true");

			var x = $("#locx" + i).val(),
				y = $("#locy" + i).val();

			titlee = $("#plTitle" + i).val();
			// 마커를 생성하고 지도에 표시합니다
			var placePosition = new kakao.maps.LatLng(x, y),
				marker = addMarker(placePosition, i),
				itemEl = getListItem(i);		//getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(placePosition);

			// 마커와 검색결과 항목에 mouseover 했을때
			// 해당 장소에 인포윈도우에 장소명을 표시합니다
			// mouseout 했을 때는 인포윈도우를 닫습니다

			(function(marker, title, x, y) {
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					displayInfowindow(marker, title);
					map.panTo(new kakao.maps.LatLng(x, y));
				});

				kakao.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});

				itemEl.onmouseover = function() {
					displayInfowindow(marker, title);
					map.panTo(new kakao.maps.LatLng(x, y));
				};

				itemEl.onmouseout = function() {
					infowindow.close();
				};
			})(marker, titlee, x, y);

			fragment.appendChild(itemEl);
		}
	}

	// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
	listEl.appendChild(fragment);
	menuEl.scrollTop = 0;

	// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	//map.setBounds(bounds);
	return false;
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index) {

	var el = document.createElement('li'),
		itemStr = '<a href="/car/carInfo?no='+$("#plCarno"+index).val()+'"><span class="marker_' + (index + 1) + '">        </span>' +
			'<div class="info">' +
			//'   <h5>' + places.place_name + '</h5>';
			'<h5>' + $("#plTitle" + index).val() + '</h5>';


	itemStr += '    <span>[' + $("#plRegion" + index).val() + '] ' + $("#plNickname" + index).val() + '</span>';


	itemStr += '  <br><span class="tel">' + /*places.phone*/
		'<i class="fas fa-eye"></i> ' + $("#plViews" + index).val() + '&nbsp;&nbsp;&nbsp;' +
		'<i class="fas fa-comment"></i> ' + $("#plCount" + index).val() + '&nbsp;&nbsp;&nbsp;' +
		'<i class="fa fa-clock clock"></i> ' + $("#plWritedate" + index).val() +
		'</span>' +
		'</div></a>';

	el.innerHTML = itemStr;
	el.className = 'item';
	return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx) {
	var marker = new kakao.maps.Marker({
			position: position, // 마커의 위치
			//image: markerImage
		});

	marker.setMap(map); // 지도 위에 마커를 표출합니다
	markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
	}
	markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
	var paginationEl = document.getElementById('pagination'),
		fragment = document.createDocumentFragment(),
		i;

	// 기존에 추가된 페이지번호를 삭제합니다
	while (paginationEl.hasChildNodes()) {
		paginationEl.removeChild(paginationEl.lastChild);
	}

	for (i = 1; i <= pagination.last; i++) {
		var el = document.createElement('a');
		el.href = "#";
		el.innerHTML = i;

		if (i === pagination.current) {
			el.className = 'on';
		} else {
			el.onclick = (function(i) {
				return function() {
					pagination.gotoPage(i);
				}
			})(i);
		}

		fragment.appendChild(el);
	}
	paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
	var content = '<div style="padding:5px;z-index:1;" id="infoWin">' + title + '</div>';
	infowindow.setContent(content);
	infowindow.open(map, marker);
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {
	while (el.hasChildNodes()) {
		el.removeChild(el.lastChild);
	}
}






