package com.campus.myapp.admin;

public class AdminTwoCampListVO {
	
	private int contentId;			//번호
	private String operDeCl;		//개장일  (평일, 주말, 평일+주말, null)
	private String operPdCl;		//개장계절 (봄, 여름, 가을, 겨울, null)
	private String firstImageUrl;	//고캠핑 이미지 URL (있거나 null)
	private String posblFcltyCl;	//특징 태그 (계곡 물놀이, 산책로, 낚시, 운동장, 수영장, 해수욕, 어린이놀이시설, 청소년체험시설)
	private String sbrsCl;			//편의 태그 (전기, 무선인터넷, 장작판매, 온수, 물놀이장, 놀이터, 운동시설, 마트, 트렘폴린)
	private String resveCl;			//예약경로 (온라인실시간예약, null, 전화, 현장)
	private String resveUrl;		//후기작성URL (있거나 null)
	private String homepage;		//홈페이지URL (있거나 null)
	private String tel;				//전화번호
	private String addr1;			//1번째 주소
	private String addr2;			//2번째 주소
	private String sigunguNm;		//시/군/구
	private String doNm;			//시/도
	private String lctCl;			//위치 태그 (산, 강, 계곡, 섬, 숲, 해변, 도심 등)
	private String induty;			//캠핑종류 태그 (글램핑, 카라반, 일반야영장, 자동차야영장 등)
	private String featureNm;		//어필내용 ("반려견은 일부 사이트만 사용 가능" 등)
	private String intro;			//평가글 ( "(주)쉐르빌리안티티는 강원도 홍천군 서면에 자리했다. 서울양양고속..." 등)
	private String lineIntro;		//한줄평가글 ( "반려견과 함께 즐기는 글램핑" 등)
	private String facltNm;			//업체명 ( "(주)쉐르빌리안티티, 강나루 캠핑장" 등)
	
	private String nickname;		//아니 이거 안넣으면 이상하게 캠핑장 리스트 안나옴;;
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getContentId() {
		return contentId;
	}
	public void setContentId(int contentId) {
		this.contentId = contentId;
	}
	public String getOperDeCl() {
		return operDeCl;
	}
	public void setOperDeCl(String operDeCl) {
		this.operDeCl = operDeCl;
	}
	public String getOperPdCl() {
		return operPdCl;
	}
	public void setOperPdCl(String operPdCl) {
		this.operPdCl = operPdCl;
	}
	public String getFirstImageUrl() {
		return firstImageUrl;
	}
	public void setFirstImageUrl(String firstImageUrl) {
		this.firstImageUrl = firstImageUrl;
	}
	public String getPosblFcltyCl() {
		return posblFcltyCl;
	}
	public void setPosblFcltyCl(String posblFcltyCl) {
		this.posblFcltyCl = posblFcltyCl;
	}
	public String getSbrsCl() {
		return sbrsCl;
	}
	public void setSbrsCl(String sbrsCl) {
		this.sbrsCl = sbrsCl;
	}
	public String getResveCl() {
		return resveCl;
	}
	public void setResveCl(String resveCl) {
		this.resveCl = resveCl;
	}
	public String getResveUrl() {
		return resveUrl;
	}
	public void setResveUrl(String resveUrl) {
		this.resveUrl = resveUrl;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getSigunguNm() {
		return sigunguNm;
	}
	public void setSigunguNm(String sigunguNm) {
		this.sigunguNm = sigunguNm;
	}
	public String getDoNm() {
		return doNm;
	}
	public void setDoNm(String doNm) {
		this.doNm = doNm;
	}
	public String getLctCl() {
		return lctCl;
	}
	public void setLctCl(String lctCl) {
		this.lctCl = lctCl;
	}
	public String getInduty() {
		return induty;
	}
	public void setInduty(String induty) {
		this.induty = induty;
	}
	public String getFeatureNm() {
		return featureNm;
	}
	public void setFeatureNm(String featureNm) {
		this.featureNm = featureNm;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getLineIntro() {
		return lineIntro;
	}
	public void setLineIntro(String lineIntro) {
		this.lineIntro = lineIntro;
	}
	public String getFacltNm() {
		return facltNm;
	}
	public void setFacltNm(String facltNm) {
		this.facltNm = facltNm;
	}
}
