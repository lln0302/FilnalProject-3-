package com.campus.myapp.camping;

import java.util.List;

public class CampingVO {
    private String contentId;
    private String facltNm;
    private String lineIntro;
	private String intro;
    private String featureNm;
    private String induty;
    private String lctCl;
    private String doNm;
    private String sigunguNm;
    private String addr1;
    private String addr2;
    private String tel;
    private String homepage;
    private String resveUrl;
    private String resveCl;
    private String sbrsCl;
    private String posblFcltyCl;
    private String firstImageUrl ;
    private String operPdCl;
    private String operDeCl;
    private String modifiedtime;
    
    private List<Integer> contentIdList;
    
	public String getModifiedtime() {
		return modifiedtime;
	}

	public void setModifiedtime(String modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	@Override
	public String toString() {
		return "CampingVO [contentId=" + contentId + ", facltNm=" + facltNm + ", lineIntro=" + lineIntro + ", intro=" + intro + ", featureNm=" + featureNm + ", induty="+induty+", lctCl="+lctCl+
				", doNm="+doNm+", sigunguNm="+sigunguNm+", addr1="+ addr1 + ", addr2="+addr2+", tel="+tel+", homepage="+homepage+", resveUrl="+resveUrl+", resveCl="+resveCl+", sbrsCl="+sbrsCl+
				", posblFcltyCl="+posblFcltyCl+", firstImageUrl="+firstImageUrl+", operPdCl="+operPdCl+", operDeCl="+operDeCl+"]";
	}
	
	 public String getContentId() {
			return contentId;
		}

		public void setContentId(String contentId) {
			this.contentId = contentId;
		}

	public String getFacltNm() {
		return facltNm;
	}

	public void setFacltNm(String facltNm) {
		this.facltNm = facltNm;
	}

	public String getLineIntro() {
		return lineIntro;
	}

	public void setLineIntro(String lineIntro) {
		this.lineIntro = lineIntro;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getFeatureNm() {
		return featureNm;
	}

	public void setFeatureNm(String featureNm) {
		this.featureNm = featureNm;
	}

	public String getInduty() {
		return induty;
	}

	public void setInduty(String induty) {
		this.induty = induty;
	}

	public String getLctCl() {
		return lctCl;
	}

	public void setLctCl(String lctCl) {
		this.lctCl = lctCl;
	}

	public String getDoNm() {
		return doNm;
	}

	public void setDoNm(String doNm) {
		this.doNm = doNm;
	}

	public String getSigunguNm() {
		return sigunguNm;
	}

	public void setSigunguNm(String sigunguNm) {
		this.sigunguNm = sigunguNm;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getResveUrl() {
		return resveUrl;
	}

	public void setResveUrl(String resveUrl) {
		this.resveUrl = resveUrl;
	}

	public String getResveCl() {
		return resveCl;
	}

	public void setResveCl(String resveCl) {
		this.resveCl = resveCl;
	}

	public String getSbrsCl() {
		return sbrsCl;
	}

	public void setSbrsCl(String sbrsCl) {
		this.sbrsCl = sbrsCl;
	}

	public String getPosblFcltyCl() {
		return posblFcltyCl;
	}

	public void setPosblFcltyCl(String posblFcltyCl) {
		this.posblFcltyCl = posblFcltyCl;
	}

	public String getFirstImageUrl() {
		return firstImageUrl;
	}

	public void setFirstImageUrl(String firstImageUrl) {
		this.firstImageUrl = firstImageUrl;
	}

	public String getOperPdCl() {
		return operPdCl;
	}

	public void setOperPdCl(String operPdCl) {
		this.operPdCl = operPdCl;
	}

	public String getOperDeCl() {
		return operDeCl;
	}

	public void setOperDeCl(String operDeCl) {
		this.operDeCl = operDeCl;
	}

	public List<Integer> getContentIdList() {
		return contentIdList;
	}

	public void setContentIdList(List<Integer> contentIdList) {
		this.contentIdList = contentIdList;
	}   
}