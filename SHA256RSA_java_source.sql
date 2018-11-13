create or replace and compile java source named SHA256RSA
 as
import java.security.KeyFactory;
import java.security.Signature;
import java.security.spec.PKCS8EncodedKeySpec;

public class SHA256RSA 
{
  public static byte[] signSHA256RSA(String input, byte[] b1) throws Exception 
  {
   PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec(b1);
   KeyFactory kf = KeyFactory.getInstance("RSA");

   Signature privateSignature = Signature.getInstance("SHA256withRSA");
   privateSignature.initSign(kf.generatePrivate(spec));
   privateSignature.update(input.getBytes("UTF-8"));
   byte[] s = privateSignature.sign();
   return s;
  }
};
/