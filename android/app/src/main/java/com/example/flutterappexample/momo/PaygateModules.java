package com.example.flutterappexample.momo;

import android.util.Base64;

import com.google.gson.Gson;

import java.security.KeyFactory;
import java.security.PublicKey;
import java.security.spec.X509EncodedKeySpec;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;

public class PaygateModules {
    public static String hash;
    public static String paygate(String partnerRefId, String partnerTransId, long amount, String description,  String publicKey) {
        Map<String, Object> rawData = new HashMap<>();
        rawData.put(MoMoParameterNamePayment.PARTNERCODE, MoMoParameterNamePayment.MOMOISJ_NAME);
        rawData.put(MoMoParameterNamePayment.PARTNER_REF_ID, partnerRefId);
        rawData.put(MoMoParameterNamePayment.PARTNER_TRANS_ID, partnerTransId);
        rawData.put(MoMoParameterNamePayment.AMOUNT, amount);
        rawData.put(MoMoParameterNamePayment.DESCRIPTION, description);
        Gson gson = new Gson();
        String jsonStr = gson.toJson(rawData);
        try {
            hash = enccriptData(jsonStr, publicKey);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hash;
    }
    public static String enccriptData(String data, String puclicKeyText)
    {
        String encoded = "";
        byte[] encrypted = null;
        try {
            byte[] publicBytes = Base64.decode(puclicKeyText, Base64.DEFAULT);
            X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicBytes);
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            PublicKey pubKey = keyFactory.generatePublic(keySpec);
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1PADDING"); //or try with "RSA"
            cipher.init(Cipher.ENCRYPT_MODE, pubKey);
            encrypted = cipher.doFinal(data.getBytes());
            encoded = Base64.encodeToString(encrypted, Base64.DEFAULT);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return encoded;
    }


}
