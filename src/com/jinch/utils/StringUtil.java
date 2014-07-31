package com.jinch.utils;

/**
 * Created by 敏华 on 2014/7/31.
 */
public class StringUtil {
    /**
     * 判断字符串是否为空
     * @param str
     * @return
     */
    public static boolean isBlank(String str){
        if(str != null){
            if(!"".equals(str)){
                return true;
            }else{
                return false;
            }
        }
        return false;
    }
}
