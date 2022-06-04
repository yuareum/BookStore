# 프로젝트 기획안

      - 작성일 : 2022. 06. 01
             - 작성자 : 유아름

## 1. 프로젝트 명 : 회원제 온라인 서점 프로그램 
## 2. 기획 의도 

- 회원제 온라인 서점 프로그램은 온라인으로 도서 조회 및 구매를 할 수 있는 프로그램이다.

- 평소 온라인 서점을 꾸준히 이용하고 있어서 프로젝트 시 한 번 프로그램으로 구현해보고 싶어서 기획하게 되었다.
 
- 회원제 온라인 서점 프로그램은 도서 조회 가능하고 회원만 도서를 구매 및 리뷰를 작성할 수 있고, 장바구니 기능 및 구매한 도서 목록을 볼 수 있다.

## 3. 벤치마킹 

- 알라딘 사이트에서 도서 목록, 도서 상세 페이지와 회원 장바구니 및 구매 관련 페이지를 참고했다. 

## 4. 주요 기능 

- index.jsp에는 회원가입, 로그인, 도서 목록, 로그아웃, My Page, 관리자 페이지, 장바구니 이동 링크가 있고, 도서 검색 기능이 있다. 이 때 로그아웃과 My page, 장바구니는 로그인 시 사용 가능하고, 관리자 페이지는 관리자로 로그인 시 이동 가능하다.

- 회원 관련 기능에는 회원가입, 로그인, 로그아웃 기능, 도서 조회, 도서 구매 및 리뷰 작성 가능하다.

- 관리자(admin) 페이지에서는 우선 도서 등록을 할 수 있다. 또한, 도서 목록, 회원 목록, 전체 회원 구매 도서 목록으로 이동 가능하다.

- 도서 목록은 수정, 삭제 가능하고, 회원 목록에서는 상세 조회 및 삭제가 가능하고, 전체 회원 구매 도서 목록에서는 상세 조회가 가능하다.

- My page에서는 개인 회원 정보을 볼 수 있고 회원 정보 수정, 회원 탈퇴 및 장바구니, 구매한 도서 목록이 있다. 회원 수정 및 탈퇴 시 비밀번호 체크를 한다. 

- 장바구니에서는 상세 조회 및 삭제가 가능하고, 구매한 도서 목록에서 상세 조회가 가능하다.
 
- 도서 관련 기능은 도서 등록, 도서 목록, 도서 검색 기능, 상세 조회, 도서 구매 기능 있다.

- 상세 조회에서 장바구니에 저장 및 도서 구매가 가능하며 회원이 리뷰 작성 및 수정, 삭제를 할 수 있다. 

- 도서 구매 시 배송지 및 주문자 정보 확인 후 결제를 할 수 있고 결제 후 구매가 완료된다. 구매 완료시 구매한 권 수만큼 도서 권 수가 줄어든다.

- 관리자의 경우 도서 상세 조회에서 도서 수정 및 삭제가 가능하고, 리뷰를 삭제할 수 있다.

## 5. 기타 