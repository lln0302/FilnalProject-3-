package com.campus.myapp.car;

import java.io.*;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.campus.myapp.gather.GatherVO;


@Controller
@RequestMapping("/car/")
public class CarController {

	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	Date today = new Date();
	String dateForFile = format1.format(today);
	
	
	@Inject
	CarService service;

	@GetMapping("carList")
	public ModelAndView carList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String nickname = (String) session.getAttribute("nickname");

		mav.addObject("list", service.carList());

		mav.setViewName("car/carList");
		return mav;
	}

	@GetMapping("carWrite")
	public ModelAndView carWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("car/carWrite");
		return mav;
	}

	@GetMapping("carInfo")
	public ModelAndView carInfo(int no) {
		ModelAndView mav = new ModelAndView();

		service.carInfoCount(no);
		mav.addObject("vo", service.carSelect(no));

		mav.setViewName("car/carInfo");
		return mav;
	}

	// 차박게시판 글 등록
	@PostMapping("carWriteOk")
	public ResponseEntity<String> carWriteOk(CarVO vo, HttpSession session, HttpServletRequest req) {
		vo.setNickname((String) req.getSession().getAttribute("nickname"));

		ResponseEntity<String> entity = null; // 데이터와 처리상태를 가진다
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");

		try {
			service.carInsert(vo);

			// 정상 구현
			String msg = "<script>";
			msg += "alert('글이 등록되었습니다.');";
			msg += "location.href='/car/carList';";
			msg += "</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			String msg = "<script>";
			msg += "alert('글 등록에 실패하였습니다..');";
			msg += "location.href=history.back();";
			msg += "</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	

	@PostMapping("imgUpload")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {

		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();
		HttpSession ses = request.getSession();
		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		try {
			// 파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			// 이미지 경로 생성
			String path = ses.getServletContext().getRealPath("/") + "img\\car\\" + dateForFile + "\\";
			String ckUploadPath = path + uid + "_" + fileName;

			System.out.println(path);
			File folder = new File(path);

			// 해당 디렉토리 확인
			if (!folder.exists()) {
				try {
					folder.mkdirs(); // 폴더 없으면 생성
				} catch (Exception e) {
					e.getStackTrace();
				}
			}

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // outputStream에 저장된 데이터 전송하고 초기화

			String callback = request.getParameter("CKEditorFuncNum");
			printWriter = response.getWriter();
			String fileUrl = "/car/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName;

			UriComponents uriComponents = UriComponentsBuilder.fromPath(fileUrl).build(); // fromHttpUrl(fileName).build();
			uriComponents.encode().toUri();

			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");

			printWriter.println("<script type='text/javascript'>" + "window.parent.CKEDITOR.tools.callFunction("
					+ callback + ",'" + fileUrl + "','이미지를 업로드하였습니다.')" + "</script>");

			printWriter.flush();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null)
					out.close();
				if (printWriter != null)
					printWriter.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return;

	}

	@RequestMapping(value = "ckImgSubmit.do")
	public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) throws Exception, IOException { // 서버에 저장된 이미지 경로

		HttpSession ses = request.getSession();

		// String path = fileDir.getPath() + "ckImage/";
		String path = ses.getServletContext().getRealPath("/") + "img\\car\\" + dateForFile + "\\";
		String sDirPath = path + uid + "_" + fileName;
		File imgFile = new File(sDirPath); // 사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.

		if (imgFile.isFile()) {
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
				while ((readByte = fileInputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, readByte);
				}
				imgBuf = outputStream.toByteArray();
				length = imgBuf.length;
				out.write(imgBuf, 0, length);
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				outputStream.close();
				fileInputStream.close();
				out.close();
			}
		}
	}
	
	//차박 게시물 수정 페이지로 이동
	@GetMapping("/carEdit")
	public ModelAndView carEdit(int carno, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", service.carEdit(carno));
		mav.setViewName("car/carEdit");
		return mav; 
	}
	
	//차박 게시물 수정 처리
	@PostMapping("/carEditOk")
	public ResponseEntity<String> carEditOk(CarVO vo, MultipartFile file, 
			HttpSession session) throws Exception {
		vo.setNickname((String)session.getAttribute("nickname"));
		
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		try {
			int result = service.carEditOk(vo);
			if(result>0) {
				String msg = "<script>alert('글이 수정되었습니다.'); location.href='/car/carInfo?no="+vo.getCarno()+"';</script>";
				entity = new ResponseEntity<String>(msg,headers,HttpStatus.OK);	}//성공시 수정완료게시물로 이동
			else {
				throw new Exception();
			}
		} catch(Exception e) {
			e.printStackTrace();
			String msg = "<script>alert('글 수정에 실패하였습니다.');history.go(-1);</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST); //실패시 다시 수정폼으로 -1
		}
		return entity;
		
	}
	
	
	
	@GetMapping("/carDelete")
	public ResponseEntity<String> carDelete(int carno, HttpServletRequest request) {
		
		ResponseEntity<String> entity = null;
		
		
		
		// �씤肄붾뵫
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		
		try {
			// �궘�젣
			int result = service.carDelete(carno);
			
			// 湲� �궘�젣 �꽦怨듭떆 ckUpload �뤃�뜑�뿉 �엳�뒗 �씠誘몄� �궘�젣
			if(result>0) {
				
				String body = "<script>alert('게시물이 성공적으로 삭제되었습니다.');";
				body += "location.href='/car/carList';</script>";
				entity = new ResponseEntity<String>(body, headers, HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>("<script>history.go(-1);</script>",
						headers, HttpStatus.BAD_REQUEST);
			}
		} catch(Exception e) {
			e.printStackTrace();
			String body = "<script>alert('게시물 삭제 작업이 실패했습니다.);";
			body += "history.go(-1);</script>";
			entity = new ResponseEntity<String>(body, headers, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	

	// 댓글 처리 부분
	@PostMapping("/replyWrite")
	@ResponseBody
	public int ReplyWrite(CarVO vo, HttpSession session) {
		vo.setNickname((String) session.getAttribute("nickname"));
		return service.replyWrite(vo);
	}

	@GetMapping("/replyCountSelect")
	@ResponseBody
	public int replyCountSelect(int carno) {
		return service.replyCountSelect(carno);
	}


	@GetMapping("/replyList")
	@ResponseBody
	public List<CarReplyVO> ReplyList(int carno) {
		return service.replyList(carno);
	}


	@PostMapping("/replyEdit")
	@ResponseBody
	public int ReplyEdit(CarVO vo) {
		return service.replyEdit(vo);
	}


	@GetMapping("/replyDel")
	@ResponseBody
	public int ReplyDel(int replyno) {
		return service.replyDel(replyno);
	}

}
