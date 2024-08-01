package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum  districtCode {
    QUAN_1 ("Quận 1"),
    QUAN_2 ("Quận 2"),
    QUAN_3 ("Quận 3"),
    QUAN_4 ("Quận 4"),
    QUAN_5 ("Quận 5"),
    QUAN_6 ("Quận 6"),
    QUAN_7 ("Quận 7"),
    QUAN_8 ("Quận 8"),
    QUAN_9 ("Quận Nam Từ Liêm"),
    QUAN_NAM_TU_LIEM ("Quận Bắc Từ Lim"),
    QUAN_BAC_TU_LIEM ("Huyện Nông Lâm"),
    ;

    private final String districtName;
    districtCode(String districtName) {
        this.districtName = districtName;
    }

    public String getDistrictName() {
        return districtName;
    }
    // Dùng emum khi có 1 table ít b thai đổi như tn của các quận huện
    // HasMap sẽ không sắp xép theo key
    // TreeMap n sẽ ự sắp xếp theo key
    public static Map<String,String> type(){
        Map<String,String> listType = new HashMap<>();
        for(districtCode item : districtCode.values()){
            listType.put(item.toString() , item.districtName);
        }
        return listType;
    }
}
