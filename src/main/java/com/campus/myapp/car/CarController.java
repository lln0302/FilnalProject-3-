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

	// ??????????????? ??? ??????
	@PostMapping("carWriteOk")
	public ResponseEntity<String> carWriteOk(CarVO vo, HttpSession session, HttpServletRequest req) {
		vo.setNickname((String) req.getSession().getAttribute("nickname"));

		ResponseEntity<String> entity = null; // ???????????? ??????????????? ?????????
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");

		try {
			service.carInsert(vo);

			// ?????? ??????
			String msg = "<script>";
			msg += "alert('?????? ?????????????????????.');";
			msg += "location.href='/car/carList';";
			msg += "</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			String msg = "<script>";
			msg += "alert('??? ????????? ?????????????????????..');";
			msg += "location.href=history.back();";
			msg += "</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	

	@PostMapping("imgUpload")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {

		// ?????? ?????? ??????
		UUID uid = UUID.randomUUID();
		HttpSession ses = request.getSession();
		OutputStream out = null;
		PrintWriter printWriter = null;

		// ?????????
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		try {
			// ?????? ?????? ????????????
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			// ????????? ?????? ??????
			String path = ses.getServletContext().getRealPath("/") + "img\\car\\" + dateForFile + "\\";
			String ckUploadPath = path + uid + "_" + fileName;

			System.out.println(path);
			File folder = new File(path);

			// ?????? ???????????? ??????
			if (!folder.exists()) {
				try {
					folder.mkdirs(); // ?????? ????????? ??????
				} catch (Exception e) {
					e.getStackTrace();
				}
			}

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // outputStream??? ????????? ????????? ???????????? ?????????

			String callback = request.getParameter("CKEditorFuncNum");
			printWriter = response.getWriter();
			String fileUrl = "/car/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName;

			UriComponents uriComponents = UriComponentsBuilder.fromPath(fileUrl).build(); // fromHttpUrl(fileName).build();
			uriComponents.encode().toUri();

			// ???????????? ????????? ??????
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");

			printWriter.println("<script type='text/javascript'>" + "window.parent.CKEDITOR.tools.callFunction("
					+ callback + ",'" + fileUrl + "','???????????? ????????????????????????.')" + "</script>");

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
			HttpServletRequest request, HttpServletResponse response) throws Exception, IOException { // ????????? ????????? ????????? ??????

		HttpSession ses = request.getSession();

		// String path = fileDir.getPath() + "ckImage/";
		String path = ses.getServletContext().getRealPath("/") + "img\\car\\" + dateForFile + "\\";
		String sDirPath = path + uid + "_" + fileName;
		File imgFile = new File(sDirPath); // ?????? ????????? ?????? ????????? ?????? ??????????????? ??? ????????? ????????? ????????????.

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
	
	//?????? ????????? ?????? ???????????? ??????
	@GetMapping("/carEdit")
	public ModelAndView carEdit(int carno, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", service.carEdit(carno));
		mav.setViewName("car/carEdit");
		return mav; 
	}
	
	//?????? ????????? ?????? ??????
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
				String msg = "<script>alert('?????? ?????????????????????.'); location.href='/car/carInfo?no="+vo.getCarno()+"';</script>";
				entity = new ResponseEntity<String>(msg,headers,HttpStatus.OK);	}//????????? ???????????????????????? ??????
			else {
				throw new Exception();
			}
		} catch(Exception e) {
			e.printStackTrace();
			String msg = "<script>alert('??? ????????? ?????????????????????.');history.go(-1);</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST); //????????? ?????? ??????????????? -1
		}
		return entity;
		
	}
	
	
	
	@GetMapping("/carDelete")
	public ResponseEntity<String> carDelete(int carno, HttpServletRequest request) {
		
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		
		try {
			int result = service.carDelete(carno);
			
			if(result>0) {
				
				String body = "<script>alert('???????????? ??????????????? ?????????????????????.');";
				body += "location.href='/car/carList';</script>";
				entity = new ResponseEntity<String>(body, headers, HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>("<script>history.go(-1);</script>",
						headers, HttpStatus.BAD_REQUEST);
			}
		} catch(Exception e) {
			e.printStackTrace();
			String body = "<script>alert('????????? ?????? ????????? ??????????????????.);";
			body += "history.go(-1);</script>";
			entity = new ResponseEntity<String>(body, headers, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	

	// ?????? ?????? ??????
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
