package com.chunjae_pro01.dto;

public class Lecture {

    private int lno;
    private String lectureName;
    private String teacher;
    private String content;
    private String filePath;
    private String target;

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

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    @Override
    public String toString() {
        return "Lecture{" +
                "lno=" + lno +
                ", lectureName='" + lectureName + '\'' +
                ", teacher='" + teacher + '\'' +
                ", content='" + content + '\'' +
                ", filePath='" + filePath + '\'' +
                ", target='" + target + '\'' +
                '}';
    }

}
