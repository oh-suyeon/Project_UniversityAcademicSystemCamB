package kr.or.ddit.student.takeOff.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.util.BaseVO.BaseVO;

public class TakeOffVO extends BaseVO{

	private String takeOffApplyNum;
	private String procStatCode;
	private String year;
	private String stdId;
	private String applyDate;
	private int semCnt;
	private String disauthRsn;
	private String authDocNum;
	private String takeOffTypeCode;
	private String semCode;
	private String fileGrNum;
	private List<MultipartFile> fileList;
	private String endYearSem;
	
	private int cnt01;
	private int cnt02;
	private int cnt03;
	private int cnt04;
	private int totalCnt;
	
	public int getCnt01() {
		return cnt01;
	}
	public void setCnt01(int cnt01) {
		this.cnt01 = cnt01;
	}
	public int getCnt02() {
		return cnt02;
	}
	public void setCnt02(int cnt02) {
		this.cnt02 = cnt02;
	}
	public int getCnt03() {
		return cnt03;
	}
	public void setCnt03(int cnt03) {
		this.cnt03 = cnt03;
	}
	public int getCnt04() {
		return cnt04;
	}
	public void setCnt04(int cnt04) {
		this.cnt04 = cnt04;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public String getTakeOffApplyNum() {
		return takeOffApplyNum;
	}
	public void setTakeOffApplyNum(String takeOffApplyNum) {
		this.takeOffApplyNum = takeOffApplyNum;
	}
	public String getProcStatCode() {
		return procStatCode;
	}
	public void setProcStatCode(String procStatCode) {
		this.procStatCode = procStatCode;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getStdId() {
		return stdId;
	}
	public void setStdId(String stdId) {
		this.stdId = stdId;
	}
	public String getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}
	public int getSemCnt() {
		return semCnt;
	}
	public void setSemCnt(int semCnt) {
		this.semCnt = semCnt;
	}
	public String getDisauthRsn() {
		return disauthRsn;
	}
	public void setDisauthRsn(String disauthRsn) {
		this.disauthRsn = disauthRsn;
	}
	public String getAuthDocNum() {
		return authDocNum;
	}
	public void setAuthDocNum(String authDocNum) {
		this.authDocNum = authDocNum;
	}
	public String getTakeOffTypeCode() {
		return takeOffTypeCode;
	}
	public void setTakeOffTypeCode(String takeOffTypeCode) {
		this.takeOffTypeCode = takeOffTypeCode;
	}
	public String getSemCode() {
		return semCode;
	}
	public void setSemCode(String semCode) {
		this.semCode = semCode;
	}
	public String getFileGrNum() {
		return fileGrNum;
	}
	public void setFileGrNum(String fileGrNum) {
		this.fileGrNum = fileGrNum;
	}
	public List<MultipartFile> getFileList() {
		return fileList;
	}
	public void setFileList(List<MultipartFile> fileList) {
		this.fileList = fileList;
	}
	public String getEndYearSem() {
		return endYearSem;
	}
	public void setEndYearSem(String endYearSem) {
		this.endYearSem = endYearSem;
	}
	

}
