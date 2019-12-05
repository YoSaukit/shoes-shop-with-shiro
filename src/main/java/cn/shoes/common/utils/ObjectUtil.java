package cn.shoes.common.utils;

import org.apache.commons.lang3.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author YoSaukit
 * @date 2019/11/19 10:58
 */
public class ObjectUtil {
    /**
     * object转为String型
     */
    public static String castString(Object obj) {
        return castString(obj, "");
    }

    public static String castString(Object obj, String defaultValue) {
        return obj != null ? String.valueOf(obj) : defaultValue;
    }

    /**
     * Object转为int型
     */
    public static int castInt(Object obj) {
        return castInt(obj, 0);
    }

    public static int castInt(Object obj, int defaultValue) {
        int value = defaultValue;
        if (obj == null) {
            return value;
        }
        String strValue = castString(obj);
        if (StringUtils.isNotEmpty(strValue)) {
            try {
                value = Integer.parseInt(strValue);
            } catch (NumberFormatException e) {
                value = defaultValue;
            }
        }
        return value;
    }

    /**
     * Object转为boolean型
     */
    public static boolean castBoolean(Object obj) {
        return castBoolean(obj, false);
    }

    public static boolean castBoolean(Object obj, boolean defaultValue) {
        boolean value = defaultValue;
        if (obj != null) {
            value = Boolean.parseBoolean(castString(obj));
        }
        return value;
    }
    public static Date castDate(String obj) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return format.parse(obj);
    }
}
