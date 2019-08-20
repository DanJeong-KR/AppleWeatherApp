# Apple Weather App Clone Project
애플의 기본 날씨앱을 Open API를 사용해서 만듭니다. <br>
* 기간 : 2019.08.01 ~ 2019.08.07
* 소속 : 개인프로젝트
* 역할 : iOS 앱개발
* 사용기술 : Swift5, Network(Model and Parser), MapKit

### 설계 (마인드맵)
<a href="https://github.com/changSic/LottoriApp/files/3479876/Design_All.pdf" target="_blank"><img src="https://user-images.githubusercontent.com/38423205/62675911-edcf2080-b9e3-11e9-962a-4d0fa2379793.png" alt="My Image" width="1000"></a>
* [화면구성 부분](https://github.com/changSic/LottoriApp/files/3479875/Design_Weather.pdf)
* [데이터 모델 부분](https://github.com/changSic/LottoriApp/files/3479873/Design_DataModel.pdf)
* [네트워크 부분](https://github.com/changSic/LottoriApp/files/3479874/Design_Service.pdf)
* [유틸리티 부분 (Extension, Helper)](https://github.com/changSic/LottoriApp/files/3479872/Design_Uitility.pdf)

### [Commit Message 규칙](https://changsic.github.io/CommitMessage/)
* `feat` : 새로운 기능 추가
* `fix` : 버그 수정
* `docs` : 문서 수정
* `style` : 파일 그룹화, 세미콜론 누락, 코드 변경이 없는 경우
* `refactor` : 코드 리펙토링
* `test` : 테스트 코드, 리펙토링 테스트 코드 추가

### Reference
* [Dark Sky API](https://darksky.net/dev/docs)

### 스크린샷

<a href="/assets/demo_main.gif" target="_blank"><img src="/assets/demo_main.gif" alt="My Image" width="250"></a>   <a href="/assets/demo_selectWeather.gif" target="_blank"><img src="/assets/demo_selectWeather.gif" alt="My Image" width="250"></a>

### 데모영상
<a href="https://youtu.be/E242bRSGF2c" target="_blank"><img src="/assets/thumnail.png"></a>

<br>

### 문제해결 아카이브
* 어플을 종료해도 위치 데이터가 유실되지 않고 저장되어야 한다.
  * UserDefaults객체에 위치의 위도와 경도를 저장하는 것으로 해결할 수 있었다.
