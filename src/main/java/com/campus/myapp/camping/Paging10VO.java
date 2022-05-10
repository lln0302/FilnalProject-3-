package com.campus.myapp.camping;

import java.util.List;

public class Paging10VO {
	// 
		private int onePageRecord=10; // �� ������ �� ����� ���ڵ� �� 
		private int pageNum=1; // ���� ������
		private int totalRecord; // �� ���ڵ� ��
		private int totalPage; // �� ������ �� 
		private int offsetIndex=0;
		private int onePageCount=10; // �� ���� ǥ���� ������ ��
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
	      // offset��ġ ���
	      offsetIndex = (pageNum-1)*onePageRecord;
	      // ������ ��ȣ�� ���۰�
	      startPage = ((pageNum-1)/onePageCount*onePageCount)+1;
	   }
	   public int getTotalRecord() {
	      return totalRecord;
	   }
	   public void setTotalRecord(int totalRecord) {
	      this.totalRecord = totalRecord;
	   
	      // ����������
	      if(totalRecord%onePageRecord==0) { // ������ ���ڵ尡 ���� ��
	         totalPage = totalRecord/onePageRecord;
	      }else { // ������ ���ڵ尡 ���� ��
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
