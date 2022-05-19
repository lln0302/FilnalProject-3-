package com.campus.myapp.gather;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/gather/")
@RestController
public class GatherController {
	
	/* 지향: 맵핑 순서
	  1. 캠퍼 커뮤니티 리스트, 뷰, 등록, 수정, 삭제 
	  2. 캠퍼 참여, 참여 취소
	  3. 댓글 등록, 리스트, 수정, 삭제 
	*/ 

	@Inject
	GatherService service;

	ModelAndView mav = new ModelAndView();
	ResponseEntity<String> entity = null;

	// 캠퍼 모임 커뮤니티 리스트
	@GetMapping("/gatherList")

	 public ModelAndView GatherList(PagingVO pvo, GatherVO vo, HttpSession session) {
	  
		vo.setNickname((String)session.getAttribute("nickname"));

		// 게시판 글 페이징처리 
		pvo.setTotalPosts(service.selectTotalPosts(pvo, vo));
		mav.addObject("pvo", pvo);
	  
		mav.addObject("list", service.gatherList(pvo, vo));
		mav.setViewName("gather/gatherList"); 
		return mav; 
		
	}

	// 캠퍼 모임 커뮤니티 글등록 폼
	@GetMapping("/gatherWrite")
	public ModelAndView GatherWrite(HttpSession session, HttpServletRequest request) {
		mav.setViewName("gather/gatherWrite");
		return mav;
	}

	
	// CKeditor 서버로 이미지 전송하기
	@RequestMapping(value = "/imageUpload", method = RequestMethod.POST)
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam MultipartFile upload) throws Exception {

		// 랜덤 문자 생성 : 파일이름 중복 방지
		UUID uid = UUID.randomUUID();
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		// 인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		try {

			// 파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			// 업로드 경로
			String path = request.getServletContext().getRealPath("/ckUpload/");
			String ckUploadPath = path + uid + "_" + fileName;
			File folder = new File(path);

			// 해당 디렉토리 확인
			if (!folder.exists()) {
				try {
					folder.mkdirs(); // 폴더 생성
				} catch (Exception e) {
					e.getStackTrace();
				}
			}
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // outputStream에 저장된 데이터를 전송하고 초기화

			
			printWriter = response.getWriter();
			//String callback = request.getParameter("CKEditorFuncNum");
			String fileUrl = "/gather/imageSubmit?uid=" + uid 
					+ "&fileName=" + fileName; // 작성화면

			// 업로드 시 메시지 출력
			printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
			printWriter.flush();

		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (out != null) {out.close();}
				if (printWriter != null) {printWriter.close();}
			} catch (IOException e) {e.printStackTrace();}
		}
		return;
	}

	// CKEditor 서버로 전송된 이미지 뿌려주기
	@RequestMapping(value="/imageSubmit", method=RequestMethod.GET)
	public void ckSubmit(@RequestParam(value="uid") String uid, 
			@RequestParam(value="fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException{
		
		// 서버에 저장된 이미지 경로
		String path = request.getServletContext().getRealPath("/ckUpload/");
		String sDirPath = path + uid + "_" + fileName; 
		File imgFile = new File(sDirPath);

		// 사진 이미지를 못 찾을 때 예외처리로 빈 이미지 파일 설정
		if(imgFile.isFile()) {
			byte[] buf = new byte[1024];
			int readByte = 0;
			int length = 0;
			byte[] imgBuf = null;
			
			FileInputStream fileInputStream = null;
			ByteArrayOutputStream outputStream = null;
			ServletOutputStream out = null;
			
			try {
				fileInputStream = new FileInputStream(imgFile);
				outputStream = new ByteArrayOutputStream();
				out = response.getOutputStream();
				
				while((readByte = fileInputStream.read(buf))!= -1) {
					outputStream.write(buf, 0, readByte);
				}
				
				imgBuf = outputStream.toByteArray();
				length = imgBuf.length;
				out.write(imgBuf, 0, length);
				out.flush();
				
			}catch(IOException e) {
			}finally {
				outputStream.close();
				fileInputStream.close();
				out.close();
			}
		}
	}
	
	// CK에디터로 올린 이미지에서 썸네일 뽑아내기
	// 리뷰 중 첫번째 사진 썸네일로 지정
	public String getImgSrc(String content) {
		Pattern nonValidPattern = Pattern.compile("(?i)< *[IMG][^\\>]*[src] *= *[\"\']{0,1}([^\"\'\\ >]*)");
		int imgCnt = 0;
		String img = "";
		Matcher matcher = nonValidPattern.matcher(content);
		while (matcher.find()) {
			img = matcher.group(1);
			imgCnt++;
			if (imgCnt == 1) {
				break;
			}
		}
		return img;
	}

	// 캠퍼 모임 글등록 DB연결
	@PostMapping("/gatherWriteOK")
	public ModelAndView GatherWriteOk(GatherVO vo, MultipartFile file, HttpSession session) throws Exception {
		// 현재 session에 있는 nickname
		vo.setNickname((String) session.getAttribute("nickname"));

		try {
			int cnt = service.gatherInsert(vo);
			mav.addObject("cnt", cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("gather/writeOK");
		return mav;
	}

	// 캠퍼 모임 상세페이지(뷰)
	@GetMapping("/gatherView")
	public ModelAndView GatherView(int gatherno, GatherMemberVO vo, HttpSession session) {
		// 조회수 증가
		service.updateViews(gatherno);
		// 상세페이지 보이기
		mav.addObject("view", service.gatherView(gatherno));
		
		// 캠퍼 참여한 유저 표시
		mav.addObject("alreadyJoin", service.selectJoinCamper(gatherno, 
				(String)session.getAttribute("nickname")));
		// 캠핑 참여한 유저 리스트
		//mav.addObject("list", service.selectCamperList(vo));
		mav.setViewName("gather/gatherView");
		return mav;
	}
	
	// 캠퍼 모임 수정페이지
	@GetMapping("/gatherEdit")
	public ModelAndView GatherEdit(int gatherno, HttpSession session) {
		// 상세페이지 보이기
		mav.addObject("edit", service.selectEditView(gatherno));
		mav.setViewName("gather/gatherEdit");
		return mav; 
	}
	
	// 캠퍼 모임 글 수정
	@PostMapping("/gatherUpdate")
	public ModelAndView GatherUpdate(GatherVO vo, MultipartFile file, 
			HttpSession session) throws Exception {
		
		vo.setNickname((String)session.getAttribute("nickname"));
		System.out.println(vo.getGatherno());
		System.out.println(vo.getPlace());
		System.out.println(vo.getGmemberno());
		int cnt = service.updateEditView(vo);
		
		if(cnt>0) {
			
			mav.addObject("cnt", cnt);
			mav.addObject("vo", vo);
			mav.setViewName("gather/gatherEditSuc");
		}
		
		
		return mav;
	}
	
	
	// 캠퍼 모임 글 삭제
	@GetMapping("/gatherDel")
	public ResponseEntity<String> gatherDel(int gatherno, HttpServletRequest request) {
		
		// upload 폴더 경로(삭제를 위해서)
		String path = request.getServletContext().getRealPath("/ckUpload/");
		
		// 인코딩
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		
		try {
			// 삭제
			int result = service.gatherDelete(gatherno);
			
			// 글 삭제 성공시 ckUpload 폴더에 있는 이미지 삭제
			if(result>0) {
				
				String body = "<script>alert('글이 성공적으로 삭제되었습니다.');";
				body += "location.href='/gather/gatherList';</script>";
				entity = new ResponseEntity<String>(body, headers, HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>("<script>history.go(-1);</script>",
						headers, HttpStatus.BAD_REQUEST);
			}
		} catch(Exception e) {
			e.printStackTrace();
			String body = "<script>alert('글이 삭제되지 않았습니다.);";
			body += "history.go(-1);</script>";
			entity = new ResponseEntity<String>(body, headers, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 캠퍼 참여 
	@GetMapping("/plusGatherCamper")
	public int PlusGatherCamper(int gmemberno, int gatherno, GatherMemberVO vo, HttpSession session) {
		vo.setNickname((String)session.getAttribute("nickname"));
		service.plusGatherCamper(gatherno);
		return service.gathermemberInsert(gmemberno, gatherno, vo.getNickname(), vo.getGender());
	}
	// 캠퍼 유저 수 표시
	@GetMapping("/gnewnoCount")
	public int gnewnoCount(int gatherno) {
		return service.gnewnoCountSelect(gatherno);
	}
	// 캠핑 참여한 캠퍼 리스트 보이기
	@GetMapping("/showCamperList")
	public List<GatherMemberVO> showCamperList(GatherMemberVO vo, HttpSession session) {
		vo.setNickname((String)session.getAttribute("nickname"));
		vo.setGender((String)session.getAttribute("gender"));
		return service.selectCamperList(vo);
	}
	// 캠퍼 참여 취소
	@GetMapping("/minusGatherCamper")
	public GatherMemberVO MinusGatherCamper(int gatherno, String nickname, HttpSession session) {
		nickname = (String)session.getAttribute("nickname");
		service.minusGatherCamper(gatherno);
		service.gathermemberDel(gatherno, nickname);
		return service.selectJoinCamper(gatherno, nickname);
	}
	
	
	// gather 댓글 등록하기
	@PostMapping("/replyWrite")
	public int ReplyWrite(ReplyVO vo, HttpSession session) {
		vo.setNickname((String)session.getAttribute("nickname"));
		return service.replyWrite(vo);
	}
	@GetMapping("/replyCountSelect")
	public int replyCountSelect(int gatherno) {
		return service.replyCountSelect(gatherno);
	}
	// gather 댓글 리스트 
	@GetMapping("/replyList")
	public List<ReplyVO> ReplyList(int gatherno){
		return service.replyList(gatherno);
	}
	// gather 댓글 수정
	@PostMapping("/replyEdit")
	public int ReplyEdit(ReplyVO vo) {
		return service.replyEdit(vo);
	}
	// gather 댓글 삭제
	@GetMapping("/replyDel")
	public int ReplyDel(int replyno) {
		return service.replyDel(replyno);
	}
	

}
