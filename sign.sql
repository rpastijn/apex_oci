  function sign (p_string varchar2, p_PK varchar2) return char is
    v_PK       varchar2(2000) := p_PK;
    v_PK_raw   raw(32000);
    v_sign_raw raw(32000);
    v_sign     varchar2(4000);
  begin

    v_PK := replace(v_PK,'-----END PRIVATE KEY-----','');
    v_PK := replace(v_PK,'-----BEGIN PRIVATE KEY-----','');
    v_PK := replace(v_PK,'\n','');

    v_PK_raw := utl_encode.base64_decode(utl_raw.cast_to_raw(v_PK));
    v_sign_raw := res_bm.java_sign_raw(p_string, v_PK_raw);
    v_sign := utl_raw.cast_to_varchar2(utl_encode.base64_encode(v_sign_raw));
  
    v_sign := replace(v_sign,chr(13),'');
    v_sign := replace(v_sign,chr(10),'');

    return(v_sign);
  end;
/
