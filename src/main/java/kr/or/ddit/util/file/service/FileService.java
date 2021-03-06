package kr.or.ddit.util.file.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.util.file.vo.AttachFileGroupVO;
import kr.or.ddit.util.file.vo.AttachFileVO;

public interface FileService {
		
	public String fileUpload(List<MultipartFile> fileList);

	public int insert(AttachFileGroupVO attachFileGroupVo, List<AttachFileVO> attachFileVoList);
	
	
	public List<AttachFileVO> fileList(String fileGrNum);

	public AttachFileVO selectImg(HashMap<String, Object> fileMap);
}
