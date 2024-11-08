package com.ict.manager.notice.vo;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	
		private String n_idx , subject , writer , content , f_name, pwd , write_date, old_f_name;
		private MultipartFile file_name;
		
		public String getN_idx() {
			return n_idx;
		}
		public void setN_idx(String n_idx) {
			this.n_idx = n_idx;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getF_name() {
			return f_name;
		}
		public void setF_name(String f_name) {
			this.f_name = f_name;
		}
		public String getPwd() {
			return pwd;
		}
		public void setPwd(String pwd) {
			this.pwd = pwd;
		}
		public String getWrite_date() {
			return write_date;
		}
		public void setWrite_date(String write_date) {
			this.write_date = write_date;
		}
		public String getOld_f_name() {
			return old_f_name;
		}
		public void setOld_f_name(String old_f_name) {
			this.old_f_name = old_f_name;
		}
		public MultipartFile getFile_name() {
			return file_name;
		}
		public void setFile_name(MultipartFile file_name) {
			this.file_name = file_name;
		}
		
		
}
