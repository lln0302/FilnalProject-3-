package com.campus.myapp.supply;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.campus.myapp.car.CarReplyVO;
import com.campus.myapp.car.CarVO;

@Controller
@RequestMapping("/supply/")
public class SupplyController {
	
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	Date today = new Date();
	String dateForFile = format1.format(today);
	
	@Inject
	SupplyService service;
	
	@GetMapping("supplyList")
	public ModelAndView supplyList(SupplyPagingVO pvo, SupplyVO vo, HttpSession session) {
		vo.setNickname((String)session.getAttribute("nickname"));
		ModelAndView mav = new ModelAndView();
		
		pvo.setTotalPosts(service.selectTotalSupply());
		mav.addObject("pvo", pvo);
		System.out.println(pvo.toString());
		mav.addObject("list", service.supplyList(pvo, vo));
		
		mav.setViewName("supply/supplyList");
		return mav;
	}
	
	@GetMapping("supplyInfo")
	public ModelAndView supplyInfo(int no) {
		ModelAndView mav = new ModelAndView();
		
		service.supplyInfoCount(no);
		mav.addObject("vo", service.supplySelect(no));
		
		mav.setViewName("supply/supplyInfo");
		return mav;
	}
	
	@GetMapping("supplyWrite")
	public ModelAndView supplyWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("supply/supplyWrite");
		return mav;
	}
	
	
	@PostMapping("supplyWriteOk")
	public ResponseEntity<String> supplyWriteOk(SupplyVO vo, HttpSession session, HttpServletRequest req,
			@RequestParam("thumbnailImg") MultipartFile thumbnailImg) {
		vo.setNickname((String) req.getSession().getAttribute("nickname"));
		String path = req.getServletContext().getRealPath("/img/supply/thumbnailImg/");
		System.out.println(path);
		
		String pathName = null;
		UUID uid = UUID.randomUUID();
		
		ResponseEntity<String> entity = null; // ???????????? ??????????????? ?????????
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		String path2 = uid + "_" + dateForFile;
		
		try {
			pathName = path + path2;
			try {
				File dest = new File(pathName);
				// ?????? ???????????? ??????
				if (!dest.exists()) {
					try {
						dest.mkdirs(); // ?????? ????????? ??????
					} catch (Exception e) {
						e.getStackTrace();
					}
				}
				thumbnailImg.transferTo(dest);
				vo.setPhoto(path2);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			int rst = service.supplyInsert(vo);
			if(rst == 0) throw new Exception();

			// ?????? ??????
			String msg = "<script>";
			msg += "alert('?????? ?????????????????????.');";
			msg += "location.href='/supply/supplyList';";
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
	
	@GetMapping("supplyEdit")
	public ModelAndView supplyEdit(int supplyno) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", service.supplySelect(supplyno));
		
		mav.setViewName("supply/supplyEdit");
		return mav;
	}
	@PostMapping("supplyEditOk")
	public ResponseEntity<String> supplyEditOk(SupplyVO vo, HttpSession session) throws Exception {
		vo.setNickname((String)session.getAttribute("nickname"));
		
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		
		try {
			int result = service.supplyEditOk(vo);
			if(result>0) {
				String msg = "<script>alert('?????? ?????????????????????.'); location.href='/supply/supplyInfo?no="+vo.getSupplyno()+"';</script>";
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
	
	
	
	
	@GetMapping("supplyDelete")
	public ResponseEntity<String> supplyDelete(int supplyno, HttpServletRequest request) {
		
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		
		try {
			int result = service.supplyDelete(supplyno);
			
			if(result>0) {
				
				String body = "<script>alert('???????????? ??????????????? ?????????????????????.');";
				body += "location.href='/supply/supplyList';</script>";
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
	
	
	
	
	
	
	
	/* CKEDITOR ????????? ????????? ?????? */
	
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
			String path = ses.getServletContext().getRealPath("/") + "img\\supply\\" + dateForFile + "\\";
			String ckUploadPath = path + uid + "_" + fileName;

			//System.out.println(path);
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
			String fileUrl = "/supply/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName;

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
		String path = ses.getServletContext().getRealPath("/") + "img\\supply\\" + dateForFile + "\\";
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
	
	//??????????????? ??????
	@GetMapping("supplyChat")
	public ModelAndView supplyChat() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("supply/supplyChat");
		return mav;
	}
	
	
	

	
	/* ???????????? ????????? ?????? ?????? */
	
	@PostMapping("chatWrite")
	@ResponseBody
	public int chatWrite(ChatVO vo, HttpSession session) {
		vo.setClientNickname((String) session.getAttribute("nickname"));
		return service.chatWrite(vo);
	}

	@GetMapping("chatCountSelect")
	@ResponseBody
	public int chatCountSelect(int supplyno) {
		return service.chatCountSelect(supplyno);
	}
	
	@GetMapping("chatList")
	@ResponseBody
	public List<ChatVO> chatList(int supplyno) {
		return service.chatList(supplyno);
	}
	
	@GetMapping("chatDel")
	@ResponseBody
	public int chatDel(int roomno) {
		return service.chatDel(roomno);
	}
	
	@GetMapping("moveChat")
	public ModelAndView moveChat(int roomno) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", service.chatSelect(roomno));
		mav.setViewName("supply/supplyChat");
		
		return mav;
	}
	
	@RequestMapping("chatSend")
	@ResponseBody
	public void chatSend(ChatVO vo) {
		service.chatSend(vo);
	}
	
	
	
	
	
	
}
