hexo-auto-title
===============

Translate hexo generated korean filename to english.

hexo 프레임워크에서 permalink에 :title 토큰을 포함시킨 경우,  
GitHub Pages에 호스팅 할 때 인코딩 호환 문제로 에러가 뜨지 않도록  
네이버 파파고 API를 이용하여 영어로 자동으로 변환해주는 쉘 스크립트 입니다.

Dependencies
------------
* [네이버 개발자 센터](https://developers.naver.com/)에서 파파고 오픈 API키를 발급 받으셔야 합니다.
* curl, python3, awk 가 설치 되어 있어야 합니다.

## Usage

### 설치 & 세팅
```sh
git clone https://github.com/Xvezda/hexo-auto-title.git # 혹은 zip 다운로드
cd hexo-auto-title

# autotitle.sh를 실행 가능하도록 합니다
chmod +x autotitle.sh

mv autotitle.sh "hexo init으로 생성한 폴더경로"

cd "hexo init으로 생성한 폴더경로"
```

실행 하기 전에 autotitle.sh 파일을 편집기로 열어,
가장 위 EDITOR, API_ID, API_SEC 변수를 입력하여 저장하셔야 합니다.

ex)  
EDITOR="vim" # 포스팅 작성에 vim 편집기 사용  
API_ID="발급받은 API Client ID 값"  
API_SEC="발급받은 API Client Secret 값"  

### 실행 & 포스팅
```sh
# 로드가 완료되면 편집기가 뜨면서 글을 작성할 수 있습니다.
./autotitle.sh "한글 포스팅 제목"
```

### More Information
* 에러가 발생하는 경우 curl, python3, awk가 설치 되어 있는지 확인하세요.
* 파파고™, 네이버™는 NAVER㈜의 등록상표입니다.
* [NAVER Developers](https://developers.naver.com)
* [Hexo](https://github.com/hexojs/hexo)
* [GitHub Pages](https://pages.github.com/)
