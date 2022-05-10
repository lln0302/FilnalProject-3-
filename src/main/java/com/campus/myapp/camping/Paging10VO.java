package com.campus.myapp.camping;

import java.util.List;

public class Paging10VO {
	// 
		private int onePageRecord=10; // 한 페이지 당 출력할 레코드 수 
		private int pageNum=1; // 현재 페이지
		private int totalRecord; // 총 레코드 수
		private int totalPage; // 총 페이지 수 
		private int offsetIndex=0;
		private int onePageCount=10; // 한 번에 표시할 페이지 수
		private int startPage = 1;
		
		private String doNm;
		private String sigunguNm;
		
		private List<String> induty;
		private List<String> sbrsCl;
		
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
		public List<String> getInduty() {
			return induty;
		}
		public void setInduty(List<String> induty) {
			this.induty = induty;
		}
		public List<String> getSbrsCl() {
			return sbrsCl;
		}
		public void setSbrsCl(List<String> sbrsCl) {
			this.sbrsCl = sbrsCl;
		}
	public int getOnePageRecord() {
	      return onePageRecord;
	   }
	   public void setOnePageRecord(int onePageRecord) {
	      this.onePageRecord = onePageRecord;
	   }
	   public int getPageNum() {
	      return pageNum;
	   }
	   public void setPageNum(int pageNum) {
	      this.pageNum = pageNum;
	      // offset위치 계산
	      offsetIndex = (pageNum-1)*onePageRecord;
	      // 페이지 번호의 시작값
	      startPage = ((pageNum-1)/onePageCount*onePageCount)+1;
	   }
	   public int getTotalRecord() {
	      return totalRecord;
	   }
	   public void setTotalRecord(int totalRecord) {
	      this.totalRecord = totalRecord;
	   
	      // 총페이지수
	      if(totalRecord%onePageRecord==0) { // 나머지 레코드가 없을 때
	         totalPage = totalRecord/onePageRecord;
	      }else { // 나머지 레코드가 있을 때
	         totalPage = totalRecord/onePageRecord+1;
	      }
	   }
	   
	   
	   public int getTotalPage() {
	      return totalPage;
	   }
	   public void setTotalPage(int totalPage) {
	      this.totalPage = totalPage;
	   }
	   public int getOffsetIndex() {
	      return offsetIndex;
	   }
	   public void setOffsetIndex(int offsetIndex) {
	      this.offsetIndex = offsetIndex;
	   }
	   public int getOnePageCount() {
	      return onePageCount;
	   }
	   public void setOnePageCount(int onePageCount) {
	      this.onePageCount = onePageCount;
	   }
	   public int getStartPage() {
	      return startPage;
	   }
	   public void setStartPage(int startPage) {
	      this.startPage = startPage;
	   }
}
