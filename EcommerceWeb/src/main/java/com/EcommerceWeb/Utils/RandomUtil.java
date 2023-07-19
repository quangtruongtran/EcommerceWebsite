package com.EcommerceWeb.Utils;

import java.util.Random;

public class RandomUtil {
    public static String randomUtil(){
        int leftLimit = 97;
        int rightLimit = 122;
        int len = 13;
        Random random = new Random();
        StringBuilder buffer = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            int randomLimitedInt = leftLimit + (int)
                    (random.nextFloat() * (rightLimit - leftLimit + 1));
            buffer.append((char) randomLimitedInt);
        }
        String generatedString = buffer.toString();
        return generatedString;
    }
}
