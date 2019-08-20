# Apple Weather App Clone Project
애플의 기본 날씨앱을 Open API를 사용해서 만듭니다. <br>
* 기간 : 2019.08.01 ~ 2019.08.07
* 소속 : 개인프로젝트
* 역할 : iOS 앱개발
* 사용기술 : Swift5, Network(Model and Pars), MapKit


### 설계 (마인드맵)
<a href="https://github.com/changSic/LottoriApp/files/3479876/Design_All.pdf" target="_blank"><img src="https://user-images.githubusercontent.com/38423205/62675911-edcf2080-b9e3-11e9-962a-4d0fa2379793.png" alt="My Image" width="1000"></a>
  * [화면구성 부분](https://github.com/changSic/LottoriApp/files/3479875/Design_Weather.pdf)
  * [데이터 모델 부분](https://github.com/changSic/LottoriApp/files/3479873/Design_DataModel.pdf)
  * [네트워크 부분](https://github.com/changSic/LottoriApp/files/3479874/Design_Service.pdf)
  * [유틸리티 부분 (Extension, Helper)](https://github.com/changSic/LottoriApp/files/3479872/Design_Uitility.pdf)

### 스크린샷

<a href="/assets/demo_main.gif" target="_blank"><img src="/assets/demo_main.gif" alt="My Image" width="250"></a>   <a href="/assets/demo_selectWeather.gif" target="_blank"><img src="/assets/demo_selectWeather.gif" alt="My Image" width="250"></a>

### 데모영상
<a href="https://youtu.be/E242bRSGF2c" target="_blank"><img src="/assets/thumnail.png"></a>

<br>

### 문제해결 아카이브
  * 심장이 두근거리는 애니메이션을 어떻게 구현할까
    * <strong>AnimationKeyFrame</strong>으로 두근거림의 디테일을 해결했다.
  * 사용자가 특별한 조언을 받는 느낌을 받아야 한다.
    * <strong>MotionProximity</strong>를 활용해서 사용자의 손을 센서를 통해 인식할 수 있고 사용자가 단순히 버튼을 누르는 것이 아니라 마술을 부리는 것 같은 느낌을 줄 수 있었다.
  * 깔끔한 디자인의 버튼을 구현하려면 부가설명이 없이 직관적이어야 한다.
    * 다음 화면으로 넘어가는 버튼은 두근거리는 애니메이션을 적용해서 사용자가 직관적으로 누르고 싶게 만들 수 있었다.
    * 되돌아 가기 버튼은 화살표가 반대쪽으로 돌아가는 애니메이션을 적용해서 사용자가 직관적으로 뒤로 간다는 느낌이 들게 만들 수 있었다.


* ### Apple Weather App

* # 앱 설계 - Design
  * 미리보기
  <a href="https://user-images.githubusercontent.com/38423205/62675911-edcf2080-b9e3-11e9-962a-4d0fa2379793.png" target="_blank"><img src="https://user-images.githubusercontent.com/38423205/62675911-edcf2080-b9e3-11e9-962a-4d0fa2379793.png" alt="My Image" width="1000"></a>
  * ### [전체 디자인 부분](https://github.com/changSic/LottoriApp/files/3479876/Design_All.pdf)
    * ### [화면구성 부분](https://github.com/changSic/LottoriApp/files/3479875/Design_Weather.pdf)
    * ### [데이터 모델 부분](https://github.com/changSic/LottoriApp/files/3479873/Design_DataModel.pdf)
    * ### [네트워크 부분](https://github.com/changSic/LottoriApp/files/3479874/Design_Service.pdf)
    * ### [유틸리티 부분 (Extension, Helper)](https://github.com/changSic/LottoriApp/files/3479872/Design_Uitility.pdf)

* ### [Commit Message 규칙](https://changsic.github.io/CommitMessage/)
  * `feat` : 새로운 기능 추가
  * `fix` : 버그 수정
  * `docs` : 문서 수정
  * `style` : 파일 그룹화, 세미콜론 누락, 코드 변경이 없는 경우
  * `refactor` : 코드 리펙토링
  * `test` : 테스트 코드, 리펙토링 테스트 코드 추가

* ### Reference
  * [Dark Sky API](https://darksky.net/dev/docs)



* ### 필수 구현 사항
* Networking
  * Model & Parser
  * API의 응답을 이용한 날씨 정보 화면 구현 검색
* Location
  * MapKit을 이용해서 도시명 검색
  * MapKit을 통해 얻어낸 검색된 도시의 위/경도 좌표로 날씨 API 호출 검색된 도시정보를 **앱 재시작 시**, 반영될 수 있도록 구현
