select * from TB_USRBIZTW_DETAIL;
select * from TB_USRBIZTW_CONTENT;

select * from TB_USRBIZNW_DETAIL;
select * from TB_USRBIZNW_CONTENT;

select * from TB_WEEK_SCOPE;

insert into TB_USRBIZWK_MASTER
values
('21', 10, 'yjkim1', getdate(), 'yjkim1', null, null);

insert into TB_USRBIZTW_DETAIL
values
(
'21', 10, 'yjkim1', 1, 1, getdate(), 'yjkim1', null, null);

insert into TB_USRBIZTW_DETAIL
values
(
'21', 10, 'yjkim1', 3, 2, getdate(), 'yjkim1', null, null);

insert into TB_USRBIZTW_CONTENT
values
(
'21', 10, 'yjkim1', 1, 1, ' 작지 개별 및 이미지 복사 기능 개발
    - SSEN10 개발된 이미지 및 작지 데이터 복사 기능
      : 다중 작지 개별 복사 기능 추가 개발
  작지 관련 4차 현업 개발 요청건 처리
       - 4차 현업 개발 요청건 접수
         : 오류 사항 및 추가 접수건 개발
 Spring framework 개발 2차 교육
        - Spring framework 2차 교육 진행 완료
 Infra 근태 기능 추가
       - 유지보수 업체 근태 관리 프로세스 정립 및
          프로그램 개발 완료 및 배포. 교육 진행
', getdate(), 'yjkim1', null, null);

insert into TB_USRBIZTW_CONTENT
values
(
'21', 10, 'yjkim1', 3, 1, ' 작지 표준 자료 등록 Layout 수정
     - 출력 일자 필드 추가에 따른 작지서 Layout 재변경
', getdate(), 'yjkim1', null, null);

-- 다음주 계획
insert into TB_USRBIZNW_DETAIL
values
(
'21', 10, 'yjkim1', 1, 1, getdate(), 'yjkim1', null, null);

insert into TB_USRBIZNW_DETAIL
values
(
'21', 10, 'yjkim1', 3, 2, getdate(), 'yjkim1', null, null);

insert into TB_USRBIZNW_CONTENT
values
(
'21', 10, 'yjkim1', 1, 1, ' 작지 개별 및 이미지 복사 기능 개발
    - SSEN10 개발된 이미지 및 작지 데이터 복사 기능
      : 다중 작지 개별 복사 기능 추가 개발
  작지 관련 4차 현업 개발 요청건 처리
       - 4차 현업 개발 요청건 접수
         : 오류 사항 및 추가 접수건 개발
 Spring framework 개발 2차 교육
        - Spring framework 2차 교육 진행 완료
 Infra 근태 기능 추가
       - 유지보수 업체 근태 관리 프로세스 정립 및
          프로그램 개발 완료 및 배포. 교육 진행
', getdate(), 'yjkim1', null, null);

insert into TB_USRBIZNW_CONTENT
values
(
'21', 10, 'yjkim1', 3, 1, ' 작지 표준 자료 등록 Layout 수정
     - 출력 일자 필드 추가에 따른 작지서 Layout 재변경
', getdate(), 'yjkim1', null, null);