# 🎬 ImgTube - YouTube Clone Platform

![Java](https://img.shields.io/badge/Java-11-orange?style=flat&logo=openjdk)
![Servlet](https://img.shields.io/badge/Jakarta_Servlet-5.0-blue?style=flat&logo=apache)
![JSP](https://img.shields.io/badge/JSP-2.0-orange?style=flat&logo=java)
![SQL](https://img.shields.io/badge/SQL_Server-2019-red?style=flat&logo=microsoftsqlserver)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5.3-purple?style=flat&logo=bootstrap)

> **Đồ án môn học PRJ301 - Java Web Application Development**  
> *Xây dựng nền tảng chia sẻ video trực tuyến tương tự YouTube*

---

## 📋 Mô tả dự án

**ImgTube** là một ứng dụng web clone của YouTube được xây dựng bằng công nghệ Java Servlet/JSP, cho phép người dùng đăng tải, xem, quản lý và tương tác với các video. Dự án được phát triển trong khuôn khổ môn học PRJ301 tại FPT University.

---

## 🚀 Tính năng chính

### 👤 **Quản lý người dùng**
- ✅ **Đăng ký tài khoản** mới với email validation
- ✅ **Đăng nhập/Đăng xuất** với session management
- ✅ **Phân quyền người dùng** (User/Admin)
- ✅ **Quản lý trạng thái** (Active/Banned)
- 🔒 **Bảo mật:** Chặn truy cập login/register khi đã đăng nhập

### 🎥 **Quản lý Video**
- ✅ **Đăng tải video** với thông tin chi tiết
- ✅ **Xem video** với giao diện responsive
- ✅ **Chỉnh sửa thông tin** video (title, description, category)
- ✅ **Xóa video** (chỉ chủ sở hữu)
- ✅ **Quản lý trạng thái** video (Active/Inactive)

### 📂 **Phân loại nội dung**
- ✅ **Danh mục video** (Game, Âm nhạc, Phim, Tin tức, Giáo dục, Thể thao)
- ✅ **Lọc video theo category**
- ⏳ **Tìm kiếm video** (đang phát triển)

### 💬 **Tương tác xã hội**
- ✅ **Bình luận** trên video
- ✅ **Đăng ký kênh** (Subscribe/Unsubscribe)
- ✅ **Dashboard cá nhân** với thống kê

### 🛡️ **Quản trị hệ thống**
- ✅ **Admin Dashboard** với đầy đủ quyền quản lý
- ✅ **Quản lý người dùng** (xem, ban/unban)
- ✅ **Quản lý video** của toàn hệ thống
- ✅ **Thống kê và báo cáo**

---

## 🏗️ Kiến trúc hệ thống

### **Công nghệ stack**
- **Backend:** Java 11, Jakarta Servlet 5.0, JSP 2.0
- **Frontend:** HTML5, CSS3, Bootstrap 5.3, JavaScript
- **Database:** Microsoft SQL Server 2019
- **Build Tool:** Apache Maven
- **Server:** Apache Tomcat 10+

### **Mô hình MVC**
```
├── Model (Java Beans)
│   ├── User.java
│   ├── Video.java
│   ├── Category.java
│   └── Comment.java
├── View (JSP Pages)
│   ├── home.jsp
│   ├── login.jsp
│   ├── register.jsp
│   └── dashboard.jsp
└── Controller (Servlets)
    ├── LoginServlet.java
    ├── VideoServlet.java
    └── AdminServlet.java
```

---

## 🗄️ Database Schema

### **Các bảng chính**
```sql
Users (userID, username, password, fullName, email, role, status)
Categories (categoryID, categoryName)
Videos (videoID, title, description, urlVideo, uploadDate, status, userID, categoryID)
Comments (commentID, content, commentDate, status, userID, videoID)
Subscriptions (subscriberID, channelOwnerID)
```

### **Mối quan hệ**
- `Users` 1 ↔ N `Videos` (một user có nhiều video)
- `Users` 1 ↔ N `Comments` (một user có nhiều bình luận)
- `Videos` 1 ↔ N `Comments` (một video có nhiều bình luận)
- `Users` N ↔ N `Users` (quan hệ subscribe)

---

## 📁 Cấu trúc project

```
Assignment/
├── src/main/
│   ├── java/
│   │   ├── controller/     # Servlet controllers
│   │   ├── dao/           # Data Access Objects
│   │   ├── model/         # Java Beans/Entities
│   │   ├── filter/        # Security filters
│   │   └── util/          # Utility classes
│   ├── webapp/
│   │   ├── *.jsp          # View pages
│   │   └── WEB-INF/
│   │       └── web.xml    # Deployment descriptor
├── pom.xml                # Maven configuration
└── PRJ301_YouTube.sql     # Database script
```

---

## 🛠️ Cài đặt và chạy

### **Yêu cầu**
- JDK 11+
- Apache Tomcat 10+
- Microsoft SQL Server 2019+
- Maven 3.6+

### **Các bước cài đặt**

1. **Clone project**
```bash
git clone <repository-url>
cd Assignment
```

2. **Cài đặt database**
```bash
# Chạy file SQL trong SQL Server Management Studio
sqlcmd -S localhost -U sa -P 123456 -i PRJ301_YouTube.sql
```

3. **Cấu hình kết nối database**
```java
// Trong util/DBContext.java
String dbURL = "jdbc:sqlserver://localhost:1433;"
        + "databaseName=PRJ301_YouTube;"
        + "user=sa;"
        + "password=123456;"
        + "encrypt=true;trustServerCertificate=true;";
```

4. **Build và deploy**
```bash
mvn clean install
# Deploy file WAR vào Tomcat
```

5. **Truy cập ứng dụng**
```
http://localhost:8080/Assignment/
```

---

## 🌐 API Endpoints & Routes

### **Authentication Routes**
| **Method** | **URL** | **Description** | **Access** |
|------------|---------|----------------|------------|
| GET | `/login` | Hiển thị trang đăng nhập | Public |
| POST | `/login` | Xử lý đăng nhập | Public |
| GET | `/register` | Hiển thị trang đăng ký | Public |
| POST | `/register` | Xử lý đăng ký tài khoản | Public |
| GET | `/logout` | Đăng xuất | Authenticated |

### **User Routes**
| **Method** | **URL** | **Description** | **Access** |
|------------|---------|----------------|------------|
| GET | `/home` | Trang chủ người dùng | Public |
| GET | `/dashboard` | Dashboard cá nhân | Authenticated |
| GET | `/videouser` | Video của user | Authenticated |
| GET | `/subscribe` | Đăng ký kênh | Authenticated |

### **Video Routes**
| **Method** | **URL** | **Description** | **Access** |
|------------|---------|----------------|------------|
| GET | `/video` | Quản lý video | Authenticated |
| GET | `/videodetail` | Chi tiết video | Public |
| GET | `/addvideo` | Thêm video mới | Authenticated |
| GET | `/updatevideo` | Cập nhật video | Authenticated |
| GET | `/deletevideo` | Xóa video | Authenticated |

### **Admin Routes**
| **Method** | **URL** | **Description** | **Access** |
|------------|---------|----------------|------------|
| GET | `/admin` | Admin Dashboard | Admin |
| GET | `/manageUsers` | Quản lý người dùng | Admin |
| GET | `/manageVideos` | Quản lý video hệ thống | Admin |

### **Category & Filter Routes**
| **Method** | **URL** | **Description** | **Access** |
|------------|---------|----------------|------------|
| GET | `/category` | Lọc theo danh mục | Public |
| GET | `/homecategory` | Trang chủ theo category | Public |
| ⏳ GET | `/search` | Tìm kiếm video (đang phát triển) | Public |

### **URL Patterns**
```java
// Servlet mappings in project
@WebServlet("/login")           -> LoginServlet
@WebServlet("/register")         -> RegisterServlet
@WebServlet("/logout")           -> LogoutServlet
@WebServlet("/home")             -> HomeServlet
@WebServlet("/video")            -> VideoServlet
@WebServlet("/videodetail")      -> VideoDetailServlet
@WebServlet("/admin")            -> AdminServlet
@WebServlet("/category")         -> CategoryServlet
@WebServlet("/search")           -> SearchServlet
@WebServlet("/subscribe")        -> SubscribeServlet
```

---

## 👥 Tài khoản demo

| **Vai trò** | **Email** | **Password** | **Mô tả** |
|-------------|-----------|-------------|-----------|
| Admin | admin@admin.prj | 123456 | Quản trị viên toàn hệ thống |
| User | binh@fpt.edu.vn | 123 | Người dùng thường |
| User | mixi@gmail.com | 123 | Kênh content creator |

---

## 🔐 Tính năng bảo mật

- **Password Hashing:** MD5 encryption
- **Session Management:** Secure session handling
- **Access Control:** Role-based authorization
- **Input Validation:** XSS protection
- **SQL Injection Prevention:** PreparedStatement
- **Authentication Filters:** Chặn truy cập không hợp lệ

---

## 🎯 Điểm nổi bật

### **User Experience**
- 🎨 **Giao diện hiện đại** với Bootstrap 5
- 📱 **Responsive design** cho mọi thiết bị
- ⚡ **Performance tối ưu** với JSP compilation
- 📂 **Phân loại nội dung** theo danh mục

### **Technical Features**
- 🏗️ **MVC Architecture** chuẩn industry
- 🔧 **Clean Code** với separation of concerns
- 🛡️ **Security layers** đa tầng
- 📊 **Admin Dashboard** đầy đủ tính năng

### **Educational Value**
- 📚 **Best practices** trong Java Web Development
- 🎓 **MVC Pattern** thực tế
- 💾 **Database Design** chuẩn hóa
- 🔐 **Security Implementation** cơ bản

---

## 🚀 Tính năng tương lai

- [ ] **Forgot Password** với email verification
- [ ] **Real-time Notifications** với WebSocket
- [ ] **Video Upload** thực tế (không chỉ YouTube URL)
- [ ] **Like/Dislike** system
- [ ] **Video Analytics** và statistics
- [ ] **API REST** cho mobile app
- [ ] **Cloud Storage** integration
- [ ] **Microservices Architecture**

---

## 🤝 Đóng góp

Dự án được phát triển bởi sinh viên FPT University trong khuôn khổ môn học PRJ301.

**Team Members:**
- CE200315 Lưu Hữu Bình - Full Stack Development & Project Coordination (Hỗ trợ mọi phần: Admin, Video, Home, Security) - binhlhce200315@gmail.com
- CE190593 Châu Quốc Inh - Video Detail Page & Frontend Development - inhqc.ce190593@gmail.com
- CE190754 Trần Minh Phước - Video User Management & Database Operations - phuoctm.ce190754@gmail.com
- CE200089 Trần Nguyễn Thiên Thanh - Home Page & User Interface - thanhtntce200089@gmail.com
- CE200437 Nguyễn Hữu Phát - Admin Panel & System Administration - phatnhce200437@gmail.com

---

## 📄 License

© 2026 FPT University - PRJ301 Course Project. Educational purposes only.

---

## 📞 Liên hệ

- **Course:** PRJ301 - Java Web Application Development
- **Instructor:** Võ Hoàng Tú
- **Email:** tuvh6@fe.edu.vn

---

> *"ImgTube - Nơi chia sẻ kiến thức và sáng tạo nội dung số"* 🎬✨
