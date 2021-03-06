package com.gnohisiam.util;

import java.security.MessageDigest;

/**
 * 该类能对密码进行加密和验证
 */
public class CipherUtil {

    //十六进制下数字到字符的映射数组
    private final static String[] hexDigits = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"};

    //把originPassword加密
    public static String generatePassword(String originPassword) {
        return encodeByMD5(originPassword);
    }

    /**
     * 验证输入的密码是否正确
     * @param password              从数据中取得的已经加密过的密码
     * @param originPassword        输入的字符串
     * @return 验证结果，TRUE:正确    FALSE:错误
     */
    public static boolean validatePassword(String password, String originPassword) {
        return password.equals(encodeByMD5(originPassword));
    }

    //对字符串进行MD5加密
    private static String encodeByMD5(String originPassword) {
        if (originPassword != null) {
            try{
                //创建具有指定算法名称的信息摘要
                MessageDigest md = MessageDigest.getInstance("MD5");
                //使用指定的字节数组对摘要进行最后更新，然后完成摘要计算
                byte[] results = md.digest(originPassword.getBytes());
                //将得到的字节数组变成字符串返回
                String resultString = byteArrayToHexString(results);
                return resultString.toUpperCase();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 转换字节数组为十六进制字符串
     * @param     字节数组
     * @return    十六进制字符串
     */
    private static String byteArrayToHexString(byte[] b) {
        StringBuffer resultStr = new StringBuffer();
        for (int i = 0; i < b.length; i++) {
            resultStr.append(byteToHexString(b[i]));
        }
        return resultStr.toString();
    }

    //将一个字节转化成十六进制形式的字符串
    private static String byteToHexString(byte b) {
        int n = b;
        if (n < 0) n += 256;
        return hexDigits[n / 16] + hexDigits[n % 16];
    }

}
