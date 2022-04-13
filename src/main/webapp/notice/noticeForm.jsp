<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->

<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 -->
<title>공지사항 작성</title>
</head>
<!-- <script>

   $(document).on('click', '#btnSave', function(e){
      e.preventDefault();
      $("#form").submit();
   });
   
   $(document).on('click', '#btnList', function(e){
      e.preventDefault();
      location.href="${pageContext.request.contextPath}/notice/noticeList";
   });

</script> -->
<body>
<div style="text-align: center;">
   <table border="1">
      <form action="noticeForm.do" method="post">
         <tr>
            <td>제목</td>
            <td><input type="text" name="notice_title" size="50"></td>
         </tr>
         <tr>
            <td>내용</td>
            <td><textarea name = "notice_content" rows="10" cols="50"></textarea></td>
         </tr>
         <tr>
            <td colspan="2"><input type="submit" value="입력"></td>
         </tr>
      </form>
   </table>

</div>


<!--    <article>
         <h2>notice Form</h2>
         <form name="form" id="form" role="form" method="post" action="">
            <div class="mb-3">
               <label for="title">제목</label>
               <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
            </div>
            <div class="mb-3">
               <label for="content">내용</label>
               <textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
            </div>
         </form>
         <div >
            <button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
            <button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
         </div>
   </article> -->
</body>
</html>