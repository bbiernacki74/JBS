CREATE TABLE JG_XSLT_REPOSITORY
(
  ID                NUMBER(10,0),
  OBJECT_TYPE       VARCHAR2(30)    NOT NULL,
  XSLT              XMLTYPE         NOT NULL
)
/
ALTER TABLE JG_XSLT_REPOSITORY
ADD CONSTRAINT JG_XSRE_PK PRIMARY KEY (ID)
/
ALTER TABLE JG_XSLT_REPOSITORY
ADD CONSTRAINT JG_XSRE_OBJECT_TYPE UNIQUE (OBJECT_TYPE)
/
CREATE TABLE JG_INPUT_LOG
(
  ID                NUMBER(10,0),
  LOG_DATE          DATE DEFAULT  SYSDATE,
  FILE_NAME         VARCHAR2(100),
  OBJECT_TYPE       VARCHAR2(30),
  XML               CLOB,
  ON_TIME           VARCHAR2(1),
  STATUS            VARCHAR2(9)   DEFAULT 'READY',
  PROCESSED_DATE    DATE,
  ERROR             CLOB,
  OBJECT_ID         NUMBER(10,0)
)
/
ALTER TABLE JG_INPUT_LOG
ADD CONSTRAINT JG_INLO_PK PRIMARY KEY (ID)
/
ALTER TABLE JG_INPUT_LOG
ADD CONSTRAINT JG_INLO_STATUS_CK CHECK (STATUS IN ('READY', 'PROCESSED', 'ERROR'))
/
ALTER TABLE JG_INPUT_LOG
ADD CONSTRAINT JG_INLO_ON_TIME_CK CHECK (ON_TIME IN ('N', 'T'))
/
CREATE SEQUENCE JG_INLO_SEQ
    MINVALUE 1
    MAXVALUE 9999999999999999999999999999
    START WITH 1
    INCREMENT BY 1
    CACHE 20
/
BEGIN
    Api_Pa_Obie.Register_Table(p_object_name => 'JG_INPUT_LOG', p_subsystem_code => 'PA', p_alias => 'INLO');
    Api_Pa_Obie.Register_Sequence(p_object_name => 'JG_INLO_SEQ', p_subsystem_code => 'PA');
END;
/
