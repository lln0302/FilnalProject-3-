package com.campus.myapp.car;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@RequestMapping("/car/")
public class CarController {
	
	@Inject
	CarService service;

	@GetMapping("carList")
	public ModelAndView carList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String nickname = (String)session.getAttribute("nickname");
		
		mav.addObject("list", service.carSelect());
		
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
	public ModelAndView carInfo() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("car/carInfo");
		return mav;
	}
	
	// ���ڰԽ��� �� ���
	@PostMapping("carWriteOk")
	public ResponseEntity<String> carWriteOk(CarVO vo, HttpSession session, HttpServletRequest req) {
		vo.setNickname((String)req.getSession().getAttribute("nickname"));
		
		ResponseEntity<String> entity = null;	// �����Ϳ� ó�����¸� ������
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		
		try {
			service.carInsert(vo);
			
			//���� ����
			String msg = "<script>";
			msg += "alert('���� ��ϵǾ����ϴ�.');";
			msg += "location.href='/car/carList';";
			msg += "</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			String msg = "<script>";
			msg += "alert('�� ��Ͽ� �����Ͽ����ϴ�..');";
			msg += "location.href=history.back();";
			msg += "</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	Date today = new Date();
	String dateForFile = format1.format(today);
	
	@PostMapping("imgUpload")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
							MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {
		
		//���� ���� ����
		UUID uid = UUID.randomUUID();
		HttpSession ses = request.getSession();
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		//���ڵ�
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		try {
			//���� �̸� ��������
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			
			
			//�̹��� ��� ����
			String path = ses.getServletContext().getRealPath("/")+"img\\car\\" + dateForFile + "\\";
			String ckUploadPath = path + uid + "_" + fileName;
			
			
			
			System.out.println(path);
			File folder = new File(path);
			
			
			//�ش� ���丮 Ȯ��
			if(!folder.exists()) {
				try {
					folder.mkdirs();	//���� ������ ����
				} catch(Exception e) {
					e.getStackTrace();
				}
			}
			
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush();		//outputStream�� ����� ������ �����ϰ� �ʱ�ȭ
			
			String callback = request.getParameter("CKEditorFuncNum");
			printWriter = response.getWriter();
			String fileUrl = "/car/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName;
			
			UriComponents uriComponents = UriComponentsBuilder.fromPath(fileUrl).build();   //fromHttpUrl(fileName).build(); 
			uriComponents.encode().toUri();
			
			//���ε�� �޽��� ���
			printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
			
			printWriter.println("<script type='text/javascript'>"
                    + "window.parent.CKEDITOR.tools.callFunction("
                    + callback+",'"+ fileUrl+"','�̹����� ���ε��Ͽ����ϴ�.')"
                    +"</script>");
			
			
			printWriter.flush();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(out != null) out.close();
				if(printWriter != null) printWriter.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return ;
		
	}
	
	@RequestMapping(value="ckImgSubmit.do") 
	public void ckSubmit(@RequestParam(value="uid") String uid, 
						@RequestParam(value="fileName") String fileName, 
						HttpServletRequest request, HttpServletResponse response) throws Exception, IOException { //������ ����� �̹��� ��� 
		
		HttpSession ses = request.getSession();
		
		//String path = fileDir.getPath() + "ckImage/";
		String path = ses.getServletContext().getRealPath("/")+"img\\car\\" + dateForFile + "\\";
		String sDirPath = path + uid + "_" + fileName; 
		File imgFile = new File(sDirPath); //���� �̹��� ã�� ���ϴ� ��� ����ó���� �� �̹��� ������ �����Ѵ�. 
		
		if(imgFile.isFile()) { 
			byte[] buf = new byte[1024]; 
			int readByte = 0; 
			int length = 0; 
			byte[] imgBuf = null; 
			FileInputStream fileInputStream = null; 
			ByteArrayOutputStream outputStream = null; 
			ServletOutputStream out = null; 
			try{ 
				fileInputStream = new FileInputStream(imgFile); 
				outputStream = new ByteArrayOutputStream(); 
				out = response.getOutputStream(); 
				while((readByte = fileInputStream.read(buf)) != -1){ 
					outputStream.write(buf, 0, readByte); 
				} 
				imgBuf = outputStream.toByteArray(); 
				length = imgBuf.length; 
				out.write(imgBuf, 0, length); 
				out.flush(); 
			}catch(IOException e){ 
				e.printStackTrace();
			} finally { 
				outputStream.close(); 
				fileInputStream.close(); 
				out.close(); 
			} 
		} 
	}

	
	/*
	@PostMapping("/admin/post/imageUpload")
    public void postImage(MultipartFile upload, HttpServletResponse res, HttpServletRequest req){

        OutputStream out = null;
        PrintWriter printWriter = null;

        res.setCharacterEncoding("utf-8");
        res.setContentType("text/html;charset=utf-8");

        try{

            UUID uuid = UUID.randomUUID();
            String extension = FilenameUtils.getExtension(upload.getOriginalFilename());

            byte[] bytes = upload.getBytes();

            // ���� �̹��� ���� ���
            String imgUploadPath = uploadPath + File.separator + uuid + "." + extension;

            // �̹��� ����
            out = new FileOutputStream(imgUploadPath);
            out.write(bytes);
            out.flush();

            // ckEditor �� ����
            printWriter = res.getWriter();
            String callback = req.getParameter("CKEditorFuncNum");
            String fileUrl = "/admin/post/image/" + uuid + "." + extension;

            printWriter.println("<script type='text/javascript'>"
                    + "window.parent.CKEDITOR.tools.callFunction("
                    + callback+",'"+ fileUrl+"','�̹����� ���ε��Ͽ����ϴ�.')"
                    +"</script>");

            printWriter.flush();

        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                if(out != null) { out.close(); }
                if(printWriter != null) { printWriter.close(); }
            } catch(IOException e) { e.printStackTrace(); }
        }
    }*/
	
}
