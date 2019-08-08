
### 8월 7일 수요일 5시 제출 기한 기후 프로젝트는 수정하지 않고 README 파일만 수정합니다
* 평가하시는데 도움이 되도록 기획당시 디자인 파일과 주요 기능들을 정리합니다.

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
