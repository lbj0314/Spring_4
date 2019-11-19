package com.iu.s4.util;

import java.io.File;
import java.util.Calendar;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileSaver {
	
	public String save(String realPath, MultipartFile multipartFile)throws Exception{
		File file = new File(realPath);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		Calendar cal = Calendar.getInstance();
		Long name = cal.getTimeInMillis();
		
		String fne = multipartFile.getOriginalFilename();
		fne = fne.substring(fne.lastIndexOf("."));
		
		
		String fileName = name + fne; 
		
		file = new File(realPath, String.valueOf(fileName));
		FileCopyUtils.copy(multipartFile.getBytes(), file);
		
		return fileName;
	}
}
