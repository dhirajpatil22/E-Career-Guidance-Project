package com.app.pojos;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Chapter {
	@Override
	public String toString() {
		return "Chapter [chapterid=" + chapterid + ", moduleid=" + moduleid + ", chaptername=" + chaptername
				+ ", testid=" + testid + ", youtubelinks=" + youtubelinks + ", websitelinks=" + websitelinks
				+ ", description=" + description + "]";
	}
	private Integer chapterid;
	private Module moduleid;
	private String chaptername;
	public String getChaptername() {
		return chaptername;
	}

	public void setChaptername(String chaptername) {
		this.chaptername = chaptername;
	}
	private TestId testid;
	private String youtubelinks;
	private String websitelinks;
	private String description;
	
	public Chapter() {
		// TODO Auto-generated constructor stub
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getChapterid() {
		return chapterid;
	}
	public void setChapterid(Integer chapterid) {
		this.chapterid = chapterid;
	}
	@ManyToOne
	@JoinColumn(name="moduleid")
	public Module getModuleid() {
		return moduleid;
	}
	public void setModuleid(Module moduleid) {
		this.moduleid = moduleid;
	}
	@ManyToOne
	@JoinColumn(name="testid")
	public TestId getTestid() {
		return testid;
	}
	public void setTestid(TestId testid) {
		this.testid = testid;
	}
	public String getYoutubelinks() {
		return youtubelinks;
	}
	public void setYoutubelinks(String youtubelinks) {
		this.youtubelinks = youtubelinks;
	}
	public String getWebsitelinks() {
		return websitelinks;
	}
	public void setWebsitelinks(String websitelinks) {
		this.websitelinks = websitelinks;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
