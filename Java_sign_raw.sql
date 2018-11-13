function java_sign_raw (p_string varchar2, p_PK_raw raw) return raw
  as language JAVA
  name 'SHA256RSA.signSHA256RSA (java.lang.String, byte[]) return byte[]';
/
