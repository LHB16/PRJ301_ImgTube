package model;

import java.util.Date;

public class Video {
<<<<<<< HEAD

=======
>>>>>>> 985618be4eb3e81521557505b6449ec8d8451a0d
    private int videoId;
    private String title;
    private String description;
    private Date uploadDate;
    private User user;
    private Category category;
    private int status;
<<<<<<< HEAD
    private String urlThumbnail;
=======
>>>>>>> 985618be4eb3e81521557505b6449ec8d8451a0d

    public Video() {
    }

    public Video(int videoId, String title, String description, Date uploadDate, User user, Category category, int status) {
        this.videoId = videoId;
        this.title = title;
        this.description = description;
        this.uploadDate = uploadDate;
        this.user = user;
        this.category = category;
        this.status = status;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

<<<<<<< HEAD
=======

>>>>>>> 985618be4eb3e81521557505b6449ec8d8451a0d
    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

<<<<<<< HEAD
    public String getUrlThumbnail() {
        return urlThumbnail;
    }

=======
>>>>>>> 985618be4eb3e81521557505b6449ec8d8451a0d
    @Override
    public String toString() {
        return "Video{" + "videoId=" + videoId + ", title=" + title + ", description=" + description + ", uploadDate=" + uploadDate + ", user=" + user + ", category=" + category + ", status=" + status + '}';
    }
<<<<<<< HEAD

    public void setUrlThumbnail(String urlThumbnail) {
        this.urlThumbnail = urlThumbnail;
    }
=======
>>>>>>> 985618be4eb3e81521557505b6449ec8d8451a0d
}
