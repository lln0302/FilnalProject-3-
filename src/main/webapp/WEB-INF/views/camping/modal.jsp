<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/js/camping/review.js"></script>
<!-- 등록 modal -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h3 id="modal-title" class="modal-title">후기 글</h3>
				<button data-dismiss="modal" class="modalClose btn">&times;</button>
			</div>
			<form class="modal-body mBody">
				<input type="hidden" id="contentId" name="contentId" value="${cmmvo.contentId}"/>
				<div>
					<h5>추천</h5><hr/>
					<div id="modalLike" class="form-control">
						<input type="radio" id="recommend1" name="recommend" value="추천">
	     				<label for="추천"><i class='fa fa-thumbs-up'></i>&nbsp;추천</label>
					</div>
					<div id="modalDislike" class="form-control">
						<input type="radio" id="recommend2" name="recommend" value="비추천">
	     				<label for="비추천"><i class='fa fa-thumbs-down'></i>&nbsp;비추천</label>
					</div>
				</div>
				<br/>
				<div>
					<h5>후기</h5><hr/>
					<textarea class="form-control" id="modalContent" name="content" rows="5" 
						placeholder="캠핑장의 장단점과 솔직한 후기를 남겨주세요"></textarea>
				</div>
			</form>
			<div class="modal-footer">
				<button id="modalSubmit" class="btn">등록</button>
				<button data-dismiss="modal" class="modalClose btn">닫기</button>
			</div>
		</div><!-- modal-content -->
	</div><!-- modal-dialog -->
</div><!-- 등록 modal 끝-->
<!-- 수정 modal -->
<div class="modal fade" id="modalModify">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h3 id="modal-title" class="modal-title">후기 수정</h3>
				<button data-dismiss="modal" class="modalClose btn">&times;</button>
			</div>
			<form class="modal-body body">
				<input type="hidden" id="contentId" name="contentId" value="${cmmvo.contentId}"/>
				<input type="hidden" id="reviewno" name="reviewno"/>
				<div>
					<h5>추천</h5><hr/>
					<div id="modalLike" class="form-control">
						<input type="radio" id="modifyRecommend1" name="recommend" value="추천">
	     				<label for="추천"><i class='fa fa-thumbs-up'></i>&nbsp;추천</label>
					</div>
					<div id="modalDislike" class="form-control">
						<input type="radio" id="modifyRecommend2" name="recommend" value="비추천">
	     				<label for="비추천"><i class='fa fa-thumbs-down'></i>&nbsp;비추천</label>
					</div>
				</div>
				<br/>
				<div>
					<h5>후기</h5><hr/>
					<textarea class="form-control" id="modifyContent" name="content" rows="5" 
						placeholder="캠핑장의 장단점과 솔직한 후기를 남겨주세요"></textarea>
				</div>
			</form>
			<div class="modal-footer">
				<button id="modalUpdate" class="btn">수정</button>
				<button data-dismiss="modal" class="modalClose btn">닫기</button>
			</div>
		</div><!-- modal-content -->
	</div><!-- modal-dialog -->
</div><!-- 수정 modal 끝 -->
<!-- 뷰 modal -->
<div class="modal fade" id="viewModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h3 id="modal-title" class="modal-title">후기</h3>
				<button data-dismiss="modal" class="modalClose btn">&times;</button>
			</div>
			<div class="modal-body view">
				<div id="viewModalContent" name="content"></div>
			</div>
			<div class="modal-footer">
				<button data-dismiss="modal" class="modalClose btn">닫기</button>
			</div>
		</div><!-- modal-content -->
	</div><!-- modal-dialog -->
</div><!-- 뷰 modal 끝 -->