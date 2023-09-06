package com.chunjae_pro01.dto;

public class LectureInfo {

    private int vno;
    private int lno;
    private String lectureName;
    private String teacher;
    private String content;
    private String vTitle;
    private String filePath;
    private String duration;

    public int getVno() {
        return vno;
    }

    public void setVno(int vno) {
        this.vno = vno;
    }

    public int getLno() {
        return lno;
    }

    public void setLno(int lno) {
        this.lno = lno;
    }

    public String getLectureName() {
        return lectureName;
    }

    public void setLectureName(String lectureName) {
        this.lectureName = lectureName;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getvTitle() {
        return vTitle;
    }

    public void setvTitle(String vTitle) {
        this.vTitle = vTitle;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }


    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    @Override
    public String toString() {
        return "LectureInfo{" +
                "vno=" + vno +
                ", lno=" + lno +
                ", lectureName='" + lectureName + '\'' +
                ", teacher='" + teacher + '\'' +
                ", content='" + content + '\'' +
                ", vTitle='" + vTitle + '\'' +
                ", filePath='" + filePath + '\'' +
                ", duration='" + duration + '\'' +
                '}';
    }

}
