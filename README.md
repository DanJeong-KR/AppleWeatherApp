# Apple Weather App Clone Project
애플의 기본 날씨앱을 Open API를 사용해서 만듭니다. <br>
* 기간 : 2019.08.01 ~ 2019.08.07
* 소속 : 개인프로젝트
* 역할 : iOS 앱개발
* 사용기술 : Swift5, Network(Model and Parser), MapKit

### 설계 (마인드맵)
<a href="https://user-images.githubusercontent.com/38423205/62675911-edcf2080-b9e3-11e9-962a-4d0fa2379793.png" target="_blank"><img src="https://user-images.githubusercontent.com/38423205/62675911-edcf2080-b9e3-11e9-962a-4d0fa2379793.png" alt="My Image" width="750"></a>
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
* Json 데이터를 struct로 구조화할 때 Codable을 활용하면 데이터를 커스텀하기가 난해하기 때문에 커스텀이 필요한 데이터들은JSONSerialization을 활용할 수 있을까?
  * Optional 을 반환할 수 있는 Failer Initializer를 활용하여 JSONSerialization로 데이터모델을 구현할 수 있었다. (https://user-images.githubusercontent.com/38423205/64092872-5d40f180-cd91-11e9-9bdf-80f23182d15e.png)
* Snapkit을 사용하지 않고 Autolayout을 빠르고 오류없이 작성할 수 있을까?
  * extension을 통해 UIVIew를 확장시켜 Snapkit에 있는 메소드들을 비슷하게 구현해서 사용할 수 있었다. 이후에 유용한 extension이나 helper 메소드를 정리하는 CleanHelper 프로젝트로 확장 (https://github.com/changSic/CleanHelper)
* 어플을 종료해도 위치 데이터가 유실되지 않고 저장되어야 한다.
  * UserDefaults객체에 위치의 위도와 경도를 저장하는 것으로 해결할 수 있었다.
