1.
    popup_data 폴더를 다운로드 받는다.
	

2.

    실행
    
    sudo chmod -R 777 ./popup_data 


3.
    
    실행 (주의 - backup.sh 뒤에 파라미터로 테마폴더 이름을 기입할것)
    
    ./popup_data/backup.sh [theme_name]
    


4.

    실행  (주의 - 폴더 이동 명령을 한번에 실행 시킬 것)
    
    cd /edx/app/edxapp/edx-platform/lms/djangoapps
    
    sudo su -s /bin/bash edxapp
    /edx/bin/python.edxapp ../../manage.py lms --setting aws startapp repository
    exit

5.
    
    실행 (주의 - apply.sh 뒤에 파라미터로 테마폴더 이름을 기입할것, apply.sh는 무조건 한번만 실행할 것)
    
    cd $OLDPWD
        
    ./popup_data/apply.sh [theme_name]
    

6.

    확인
    sudo vi /edx/app/edxapp/edx-platform/lms/envs/common.py
    
    
    INSTALLED_APPS 하단에 'repository', 가 있는지 확인 (주의 - 뒤에 , 까지 포함되어야 함)
    
    sudo vi /edx/app/edxapp/edx-platform/lms/urls.py
    
    notice_detail url 하단에 
    
    url(r'^repository_list$', 'repository.views.list', name="repository_list"),
    url(r'^repository_detail$', 'repository.views.detail', name="repository_detail"),
    url(r'^/customApi/checkPopup', 'notice.views.checkPopup', name="checkPopup"),
    
    이 있는지 확인 (주의 - /customApi/checkPopup 뒤에 $가 붙어있다면 필수적으로 지울 것)
    
    
    실행 - ls /edx/app/edxapp/themes/테마폴더/lms/templates/
    
    폴더 내 notice 폴더, repository 폴더, popup.html 파일이 있는지 확인
    
    실행 - sudo vi /edx/app/edxapp/themes/테마폴더/lms/templates/index.html
    
    <%include file="${courses_list}" />  하단에
    <%include file="popup.html" />  추가
    
    실행 - sudo vi /edx/app/edxapp/themes/테마폴더/lms/templates/navigation.html
    
    하단에 링크 cookieBanner 주석처리
    
    % if user.is_authenticated(): 
        <li class="item nav-global-01">
            <a class="btn-neutral btn-register" style="padding:10px 20px;" href="/notice_list">공지사항</a>
        </li>
    하단에
              
        <li class="item nav-global-01">
            <a class="btn-neutral btn-register" style="padding:10px 20px;" href="/repository_list">자료실</a>
        </li>
    추가


    실행 - cd /edx/app/edxapp/edx-platform/lms/djangoapps/notice 
    하위
    
    models.py 에 

    detail_url = models.TextField(default='', null=True)
    is_popup = models.BooleanField(null=False, default=False)
    is_display = models.BooleanField(null=False, default=False)
    start_date = models.DateTimeField(null=True)
    end_date = models.DateTimeField(null=True)

    가 있는지 확인
    
    views.py 에
    
    def checkPopup(): 이 있는지 확인



    실행 - cd /edx/app/edxapp/edx-platform/lms/djangoapps/repository
    하위
    
    models.py, views.py의 내용이 작성되어 있는지 확인
    

7.


    sudo su -s /bin/bash edxapp
    cd /edx/app/edxapp/edx-platform/
    /edx/bin/python.edxapp ./manage.py lms --setting aws makemigrations notice
  
    오류가 아닌 내용 출력시
  
    /edx/bin/python.edxapp ./manage.py lms --setting aws migrate notice

    /edx/bin/python.edxapp ./manage.py lms --setting aws makemigrations repository
  
    오류가 아닌 내용 출력시
  
    /edx/bin/python.edxapp ./manage.py lms --setting aws migrate repository


    exit




8. 


    통계페이지에서 팝업공지사항 등록 후 메인페이지에서 확인
    


